Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root to: "splash#index"

  get "/splash", to: "splash#index"

  get "/login", to: "sessions#new"
  get "/users", to: "users#index", as: "users"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"
  get "/users/:id/edit", to: "users#edit", as: "edit"
  patch "/users/:id", to: "users#update"

  get "/cities", to: "cities#index", as: "cities"
  get "/cities/:id", to: "cities#show"

  get "/users/:user_id/posts/:post_id", to: "user_posts#show", as: "user_post"
  get "/posts/new", to: "posts#new", as: "new_post"
  post "/posts", to: "posts#create"
  patch "/posts/:post_id", to: "posts#update", as: "update_post"
  get "/posts/:post_id/edit", to: "posts#edit", as: "edit_user_post"
  delete "/posts/:user_id/posts/:posts_id", to: "user_posts#destroy", as: "delete_user_posts"
  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
