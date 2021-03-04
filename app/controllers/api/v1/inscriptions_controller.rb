module API::V1

  class InscriptionsController < BaseController
    before_action :load_inscription, only: %i[show destroy]

    # GET /api/v1/inscriptions
    def index
      @inscriptions = default_scope
    end
    
    # POST /api/v1/inscriptions
    def create
      @inscription = Inscription.new(inscription_params)
      if @inscription.save
        render :show
      else
        render_json_error(:invalid_object, @inscription)
      end
    end

    # DELETE /api/v1/inscriptions/:id
    def destroy
      if @inscription.destroy
        redirect_to :action => :index, status: 303
      else
        render_json_error(:invalid_object, @inscription)
      end
    end

    private

    def default_scope
      Inscription.all
    end

    def load_inscription
      @inscription = Inscription.find(params[:id])
    end

    def inscription_params
      params.require(:inscription).permit(:course_id, :student_id)
    end
  end
end
