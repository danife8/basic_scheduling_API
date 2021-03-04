module API::V1

  class CoursesController < BaseController
    before_action :load_course, only: %i[show edit update destroy]
    before_action :load_students, only: %i[show]

    # GET /api/v1/courses
    def index
      if params[:key].present?
        @courses = default_scope.search(params[:key], params[:value])
      else
        @courses = default_scope
      end
    end
    
    # POST /api/v1/courses
    def create
      @course = Course.new(course_params)
      if @course.save
        render :show
      else
        render_json_error(:invalid_object, @course)
      end
    end

    # PATCH /api/v1/courses/:id
    def update
      @course.update(course_params)
      if @course.save
        render :show
      else
        render_json_error(:invalid_object, @course)
      end
    end

    # DELETE /api/v1/courses/:id
    def destroy
      if @course.destroy
        redirect_to :action => :index, status: 303
      else
        render_json_error(:invalid_object, @course)
      end
    end

    private

    def default_scope
      Course.all
    end

    def load_course
      @course = Course.find(params[:id])
    end

    def load_students
      @students = @course.students
    end

    def course_params
      params.require(:course).permit(:code, :title, :description)
    end
  end
end
