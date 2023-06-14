Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
    

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

  resources :students do
    collection do
      get 'certificate'
      post 'check'
    end
  end

  resources :attendances
  
end
