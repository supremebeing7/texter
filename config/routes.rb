Texter::Application.routes.draw do
  resources :messages, only: [:index, :create, :new, :show]
end
