Rails.application.routes.draw do
  resources :programmes

  root to: 'visitors#index'
end
