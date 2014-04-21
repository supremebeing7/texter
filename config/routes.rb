Texter::Application.routes.draw do
  devise_for :users
  resources :messages, only: [:index, :create, :new, :show]
  root to: 'home#index'
end
