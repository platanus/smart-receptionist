Rails.application.routes.draw do
  resources :users, only: :index
  resources :notifications, only: :create
end
