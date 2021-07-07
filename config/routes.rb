Rails.application.routes.draw do
    devise_for :users
    namespace :api do
      namespace :v1 do
        post :auth, to: 'authentication#create'
        resources :users
        resources :users
        resources :tips, only: %i[show create index]
        resources :favorites
        resources :tips do
          post 'favorite', to: 'tips#favorite'
          post 'unfavourite', to: 'tips#unfavourite'
        end
      end
    end
end
