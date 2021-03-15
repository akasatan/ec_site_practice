Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :products
  resource :users, only: [ :edit, :update] do
    collection do
      patch 'withdraw' => 'public#customers', as: 'withdraw'
      get 'my_page' => 'users#show', as: 'show'
    end
  end
  
  resources :carts
  namespace :admins do
    resources :products
  end
  root to: 'homes#top'
end
