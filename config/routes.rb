Rails.application.routes.draw do

  resources :states

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :states
    end
  end

end
