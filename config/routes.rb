Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admins, ActiveAdmin::Devise.config
  devise_for :users

  resources :items
  root 'home#index'
end
