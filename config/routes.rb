Rails.application.routes.draw do
  devise_for :customers
  devise_for :trainers
  devise_for :users
  root to: 'pages#home'

   resources :users do
    resources :chats, only: [ :index, :new, :create ] do
      resources :messages, only: [ :index, :new, :create ]
    end
  end

  resources :chats
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
