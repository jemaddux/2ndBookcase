SecondBookcase::Application.routes.draw do
  resources :customers_books_reads

  resources :customers_books_owneds

  resources :article_comments
  resources :article_ratings
  resources :articles
  resources :admins
  resources :subscriptions

  get 'signup', to: 'customers#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'admin_login', to: 'sessions#new_admin', as: "admin_login"
  get 'admin_logout', to: 'sessions#destroy_admin', as: "admin_logout"
  post 'admin_session_create', to: 'sessions#create_admin', as: "admin_session_create"
  get "admin_books", to: "books#admin_index", as: "admin_books"
  get 'reading_list', to: 'customers#reading_list', as: 'reading_list'
  post 'reading_list/:book_id', to: 'reading_lists#update', as: 'update_reading_list'
  post 'checkout_book', to: "admins#checkout_book", as: 'checkout_book'
  post 'check_in_book', to: "admins#check_in_book", as: 'check_in_book'
  get "book_checkout", to: "admins#book_checkout", as: "book_checkout"
  get "book_check_in", to: "admins#book_check_in", as: "book_check_in"
  get "blog", to: "articles#index", as: "blog"

  resources :reading_lists
  resources :inventories
  resources :sessions
  resources :categories
  resources :customers
  resources :books
  root to: "books#index"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
