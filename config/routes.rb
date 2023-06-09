Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: "introductions#index"
  
  resources :subjects do
    collection do
      get 'search'
    end
  end

  resources :publics, only: [:index, :create, :destroy] do
    collection do
      get 'search'
    end
  end
  
end
