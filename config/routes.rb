Rails.application.routes.draw do
  devise_for :users
  
  resources :articles do
    resources :comments
  end

  resources :tags
  
  # Defines the root path route ("/")
  root "articles#index"
end