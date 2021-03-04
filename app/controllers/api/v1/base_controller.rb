module API::V1

  class BaseController < ActionController::API
    include API::V1::ExceptionHandler
    include API::V1::ResponseType
  end

end
