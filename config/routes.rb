Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "items#index"
  resources :items do
    collection do
      get 'exhibit'
      get 'confirm'
      get 'error'
      post 'pay'
      get 'category'
    end
    resources :images, only: [:index, :create]
  end

  namespace :api do
      resources :categories, only: :index, defaults: { format: 'json' }
    end
  namespace :api do
    resources :sizetypes, only: :index, defaults: { format: 'json' }
  end
  namespace :api do
    resources :brands, only: :index, defaults: { format: 'json' }
  end

  resources :users, only: [:new, :edit, :show] do
    collection do
      get 'log_out'
      get 'register'  
      get 'sign_in'
    end
  end
  resources :signup, only:[:new, :create] do
    collection do
      get 'member'
      get 'phonenumber'
      get 'address'
      get 'paymethod' 
      get 'done' 
    end
  end

end
