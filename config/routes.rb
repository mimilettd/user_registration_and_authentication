Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  resources :dashboard, only: [:index]
end
