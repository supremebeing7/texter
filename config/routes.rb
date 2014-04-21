Texter::Application.routes.draw do
  # devise_for :users (must sort out this! It's breaking our routes :()
  resources :messages, only: [:index, :create, :new, :show]
  root to: 'messages#index'
end
