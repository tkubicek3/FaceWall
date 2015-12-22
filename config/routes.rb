Rails.application.routes.draw do
  resources :comments_likes
  resources :posts_likes
  resources :comments
  resources :posts
  resources :galleries
  resources :gallery_images
  resources :galleries

  get 'users/index'
  match '/users', to: 'users#index', via: 'get'

  get '/users/friends/:id', to: 'users#friends'

  devise_for :users
  resources :users, :only => [:show]

  resources :friends, :controller => 'friendships', :except => [:show, :edit]

  # You can have the root of your site routed with "root"
  root 'posts#index'

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
