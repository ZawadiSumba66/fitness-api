Rails.application.routes.draw do
  devise_for :users
  
    namespace :api do
      namespace :v1 do
        post :auth, to: 'authentication#create'
        resources :users
        resources :favorites
        resources :tips do
          post 'favorite', to: 'tips#favorite'
          post 'unfavourite', to: 'tips#unfavourite'
        end
      end
   end
   
end
