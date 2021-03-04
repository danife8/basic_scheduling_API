module API::V1
  module ExceptionHandler
    extend ActiveSupport::Concern

    included do
      rescue_from ActiveRecord::RecordNotFound, with: :error_not_found

      # another way to resolve validation error.
      # rescue_from ActiveRecord::RecordInvalid do |exception|
      #   render_json_error(:invalid_user, exception.record)
      # end
    end

    private

    def error_not_found(exception)
      render partial: 'api/v1/shared/status',
             locals: {
               message: exception.message,
               keyword: nil
             }, status: 404
    end
  end
end
