Rails.application.routes.draw do
  root to: 'subjects#index'
  resources :subjects, only: [:index, :new, :create]
end
