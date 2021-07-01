Rails.application.routes.draw do
    devise_for :users
    namespace :api do
      namespace :v1 do
        resources :users
        resources :tips
        resources :favorites
        resources :tips, %i[show] do
          resources :favorites, only: %i[create]
        end
        post :auth, to: 'authentication#create'
      end
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
