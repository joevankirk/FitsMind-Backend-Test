Rails.application.routes.draw do
  devise_for :customers
  devise_for :trainers
  devise_for :users
  root to: 'pages#home'

  get '/trainers/new' => 'trainers#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
