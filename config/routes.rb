Rails.application.routes.draw do
  devise_for :users
  
  resources :articles do
    resources :comments
  end
  
  # Defines the root path route ("/")
  root "articles#index"
end