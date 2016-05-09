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

  get "/cities/:city_name/posts/new", to: "city_posts#new", as: "new_post"
  get "/cities", to: "cities#index", as: "cities"
  get "/cities/:id", to: "cities#show", as: "city"
  get "/users/:user_id/posts/:post_id", to: "user_posts#show", as: "user_post"
  get "/cities/:city_name/posts/:post_id", to: "user_posts#show", as: "city_post"
  post "/cities/:city_name/posts", to: "city_posts#create", as: "create_city_post"
  patch "cities/:city_name/posts/:post_id", to: "city_posts#update", as: "update_city_post"
  get "cities/:city_name/posts/:post_id/edit", to: "city_posts#edit", as: "edit_city_post"
  delete "/cities/:city_id/posts/:post_id", to: "city_posts#destroy", as: "delete_city_post"

  get "/posts/:post_id/comment/new", to: "comments#new", as: "new_comment_post"
  post "/posts/:post_id/comment/", to: "comments#create", as: "create_comment"

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
