Rails.application.routes.draw do
 devise_for :users, controllers: { sessions: 'users/sessions' , registraions: 'users/registraions' }
  resources :users do
  end
  root to:'product#index'
end
