Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  # get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:index, :show, :create, :destroy]
  resources :notifications, only: [:index]
  root to: 'homes#top'
  get '/about' => 'homes#about'

  # resources :users do
  # 	member do
  #   get :following, :followers
  #   end
  # end

  resources :users, only: [:show, :edit, :update] do
    get 'beans' => 'users#index'
    get 'favorites' => 'favorites#index'
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
    # get 'following' => 'relationships#following', as: 'following'
    # get 'followers' => 'relationships#followers', as: 'followers'
  resources :beans, only: [:index, :show, :edit, :new, :create, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :activities, only: [:index]
  get 'searches/search', as: 'search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
