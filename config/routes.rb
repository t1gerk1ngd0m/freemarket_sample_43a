Rails.application.routes.draw do
 devise_for :users, controllers: { sessions: 'users/sessions' , registraions: 'users/registraions' }
  resources :users do
    collection do
      get 'card', to: 'users#card', as: 'card'
      get 'logout', to: 'users#logout', as: 'logout'
      get 'identification', to: 'users#identification', as: 'identification'
      get 'profile', to: 'users#profile', as: 'profile'
    end
  end


  root to:'products#index'
  resources :products do
    collection do
      get 'buy', to: 'products#buy', as: 'buy'
    end
    member do
      get :preview, to: 'products#preview', as: 'preview'
      patch :preview, to: 'products#previewChange'
    end
  end

end
