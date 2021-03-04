module API::V1
  module ResponseType
    extend ActiveSupport::Concern

    def render_json_error(error_keyword, resource = nil)
      message = if resource.nil?
                  I18n.t("api.v1.errors_messages.#{error_keyword}.message", default: nil)
                else
                  resource&.errors&.full_messages&.first
                end

      keyword = I18n.t("api.v1.errors_messages.#{error_keyword}.keyword", default: nil)

      status = I18n.t("api.v1.errors_messages.#{error_keyword}.status", default: nil)

      render partial: 'api/v1/shared/status',
             locals: {
               message: message,
               keyword: keyword
             }, status: status
    end

    def render_json_success(status_code)
      render partial: 'api/v1/shared/status',
             locals: {
               message: nil,
               keyword: nil
             }, status: status_code
    end
  end
end
