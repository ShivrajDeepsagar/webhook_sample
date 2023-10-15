Rails.application.routes.draw do
  resources :webhooks, only: [:index, :create]
  root to: 'webhooks#index'
end
