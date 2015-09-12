Rails.application.routes.draw do
  resources :items
  root 'home#index'
end
