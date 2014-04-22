Texter::Application.routes.draw do
  resources :messages, only: [:index, :create, :new, :show]
  resources :contacts, only: [:index, :create, :new, :show]
  resources :welcome, only: [:index]

  root to: 'welcome#index'
  devise_for :users
end
