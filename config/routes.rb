Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"

  get '/new' => 'items#new'

  post '/new' => 'items#show'

  resources :items

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
