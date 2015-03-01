Rails.application.routes.draw do

  resources :namelines

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :namelines
    end
  end

end
