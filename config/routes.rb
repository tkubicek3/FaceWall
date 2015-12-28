Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'

  resources :posts_likes, :except => [:update, :edit, :show]
  resources :comments, :except => [:index, :show, :edit, :create, :new, :update]
  resources :posts, :except => [:new, :show]
  resources :galleries, :except => [:index]
  resources :gallery_images, :except => [:index, :edit, :show, :update]
  resources :friends, :controller => 'friendships', :except => [:show, :edit, :index, :new]

  get 'users/index'
  get '/users/friends/:id', to: 'users#friends'
  get '/post_with_image/:id', to: 'gallery_images#post_with_image', as: 'post_with_image'

  resources :users, :only => [:show]
  resources :posts, except: [:show, :new] do
    resources :comments, only: [:create, :destroy]
  end
end
