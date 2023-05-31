Rails.application.routes.draw do
  devise_for :users
  root to: "subjects#index"
  resources :subjects, only: [:index, :new, :create]
  
end
