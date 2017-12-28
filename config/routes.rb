Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :reviews do
    resources :comments
    resource :bookmark
  end

  resources :users

  resource :session

  get 'about', to: 'pages#about'
  get 'about', to: 'pages#terms'

  root 'pages#home'
end
