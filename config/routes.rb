Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "items#index"
  resources :items

  resources :users do
    collection do
      get 'log_out'
      get 'sign_in'
    end
  end
  resources :signup do
    collection do
      get 'member'
      get 'phonenumber'
      get 'address'
      get 'paymethod' 
      get 'done' 
    end
  end
end
