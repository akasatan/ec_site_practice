Rails.application.routes.draw do

  devise_for :admins, only: :sessions, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :users, skip: :all
  devise_scope :user do
    get 'users/sign_in' => 'users/sessions#new', as: :new_user_session
    post 'users/sign_in' => 'users/sessions#create', as: :user_session
    delete 'users/sign_out' => 'users/sessions#destroy', as: :destroy_user_session
    get 'users/sign_up' => 'users/registrations#new', as: :new_user_registration
    post 'users' => 'users/registrations#create'
  end

  resources :products
  resource :users, only: [:edit, :update] do
    collection do
      patch 'withdraw' => 'public#users', as: 'withdraw'
      get 'my_page' => 'users#show', as: 'show'
    end
  end
  
  resources :carts
  namespace :admins do
    resources :products
  end
  root to: 'homes#top'
end
