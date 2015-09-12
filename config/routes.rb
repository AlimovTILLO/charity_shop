Rails.application.routes.draw do
  devise_for :users
  resources :items
  root 'home#index'
end
