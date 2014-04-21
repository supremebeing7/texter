Texter::Application.routes.draw do
  resources :messages, only: [:index, :create, :new, :show]
  resources :contacts, only: [:index, :create, :new, :show]

  root to: 'messages#index'
  devise_for :users
end
