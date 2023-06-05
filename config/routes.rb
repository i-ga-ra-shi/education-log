Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: "introductions#index"
  
  resources :subjects, only: [:index, :new, :create] do
    collection do
      get 'search'
    end
  end

  resources :publics, only: [:index]
  
end
