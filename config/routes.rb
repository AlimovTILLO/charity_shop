Rails.application.routes.draw do
  devise_for :administrators, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  resources :items
  root 'home#index'
end
