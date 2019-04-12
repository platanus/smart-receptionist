Rails.application.routes.draw do
  scope path: '/api' do
    api_version(module: "Api::V1", path: { value: "v1" }, defaults: { format: 'json' }) do
    end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  mount Sidekiq::Web => '/queue'
  root 'application#index'
  resources :users, only: :index
  resources :notifications, only: :create
end
