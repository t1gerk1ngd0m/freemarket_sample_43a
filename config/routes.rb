Rails.application.routes.draw do
 devise_for :users,
 controllers: {
  sessions: 'users/sessions' ,
  registrations: 'users/registrations' ,
  omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users , :except => [:new, :create] do
    collection do
      get 'card', to: 'users#card', as: 'card'
      get 'logout', to: 'users#logout', as: 'logout'
      get 'identification', to: 'users#identification', as: 'identification'
      get 'profile', to: 'users#profile', as: 'profile'
    end
  end

  devise_scope :user do
    get 'signup/sns', to: 'users/registrations#sns', as: 'new_user_registration_sns'
  end

  root to:'products#index'
  resources :products do
    collection do
      get 'search'
      get 'buy/:id', to: 'products#buy', as: 'buy'
      post 'pay/:id' => 'products#pay', as: 'pay'
      get 'getCategory_middles'
      get 'getCategory_smalls'
    end
    member do
      get :preview, to: 'products#preview', as: 'preview'
      get :previewChange, to: 'products#previewChange', as: 'previewChange'
    end
  end

end
