Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  get '/signup', to: 'users#new'
  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :images, only: %i[index show new create destroy edit update]
  get '/current_user_images', to: 'images#show_user_images'
  put '/publish_all', to: 'images#publish_all_images'
  put '/unpublish_all', to: 'images#unpublish_all_images'
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  root 'images#index'
end
