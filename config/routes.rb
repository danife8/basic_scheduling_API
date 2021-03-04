Rails.application.routes.draw do
  
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :courses
      resources :students
      resources :inscriptions, except: %i[show update]
    end
  end
end
