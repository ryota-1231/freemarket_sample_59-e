Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "items#index"
  resources :items do
    collection do
      get 'exhibit'
    end
    resources :images, only: [:index, :create]
  end

  resources :users do
    collection do
      get 'log_out'
      get 'register'
    end
  end
end
