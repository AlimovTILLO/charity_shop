Rails.application.routes.draw do
  devise_for :administrators, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  resources :items do
    match 'buy', via: [:get, :post]
  end

  root 'home#index'

  get '/foundations', to: 'foundations#index', as: :foundations
end
