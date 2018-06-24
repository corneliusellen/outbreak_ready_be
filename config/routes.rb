Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'authenticate', to: 'authentication#authenticate'
      resources :questionnaires do
        resources :intakes, only: [:create]
        get '/demographics', to: 'demographics#index'
        get '/clinicals', to: 'clinicals#index'
        get '/exposures', to: 'exposures#index'
        get '/questions', to: 'questions#index'
        get '/foods', to: 'foods#index'
        post '/foods', to: 'foods#create'
      end
      get '/tags', to: 'tags#index'
      namespace :search do
        get '/restaurants', to: 'restaurants#index'
        get '/menus', to: 'menus#index'
      end
    end
  end
end
