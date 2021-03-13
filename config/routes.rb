Rails.application.routes.draw do
  get 'products/index'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products
  resources :users
  namespace :admins do
    resources :products
  end
  root to: 'homes#top'
end
