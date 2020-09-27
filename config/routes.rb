Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :wines, only:[:new, :create, :update, :edit, :show]

  get 'dashboard', to: 'pages#dashboard'
end
