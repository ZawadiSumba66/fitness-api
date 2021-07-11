Rails.application.routes.draw do
    devise_for :users
    namespace :api do
      namespace :v1 do
        post :auth, to: 'authentication#create'
        resources :tips
        resources :users
        resources :users, only: %i[show] do
          resources :tips
        end
        resources :favorites
        resources :tips, only: %i[show, index] do
          post 'favorite', to: 'tips#favorite'
          post 'unfavourite', to: 'tips#unfavourite'
        end
      end
    end
end
