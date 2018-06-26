Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'authenticate', to: 'authentication#authenticate'
      get '/tags', to: 'tags#index'

      resources :questionnaires do
        resources :intakes, only: [:create]
        post '/foods', to: 'foods#create'
        get '/demographics', to: 'demographics#index'
        get '/clinicals', to: 'clinicals#index'
        get '/exposures', to: 'exposures#index'
        get '/questions', to: 'questions#index'
        get '/foods', to: 'foods#index'
      end
      
      namespace :search do
        get '/restaurants', to: 'restaurants#index'
        get '/menus', to: 'menus#index'
      end
    end
  end
end
