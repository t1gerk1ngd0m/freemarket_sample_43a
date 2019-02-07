Rails.application.routes.draw do
 devise_for :users, controllers: { sessions: 'users/sessions' , registraions: 'users/registraions' }

  root to:'products#index'
  resources :products

end
