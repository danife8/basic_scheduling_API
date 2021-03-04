module API::V1

  class StudentsController < BaseController
    before_action :load_student, only: %i[show edit update destroy]
    before_action :load_courses, only: %i[show]

    # GET /api/v1/students
    def index
      if params[:key].present?
        @student = default_scope.search(params[:key], params[:value])
      else
        @student = default_scope
      end
    end

    # POST /api/v1/students
    def create
      @student = Student.new(student_params)
      if @student.save
        render :show
      else
        render_json_error(:invalid_object, @student)
      end
    end

    # PATCH /api/v1/students/:id
    def update
      @student.update(student_params)
      if @student.save
        render :show
      else
        render_json_error(:invalid_object, @student)
      end
    end

    # DELETE /api/v1/students/:id
    def destroy
      if @student.destroy
        redirect_to :action => :index, status: 303
      else
        render_json_error(:invalid_object, @student)
      end
    end

    private

    def default_scope
      Student.all
    end

    def load_student
      @student = Student.find(params[:id])
    end

    def load_courses
      @courses = @student.course
    end

    def student_params
      params.require(:student).permit(:student_id, :first_name, :last_name)
    end
  end
end
