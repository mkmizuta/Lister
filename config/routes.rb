Lister::Application.routes.draw do
  
  resources :lists
  
  get 'signup',  to: 'users#new'
  get 'signin',  to: 'session#new'
  get 'signout', to: 'session#destroy'
  post '/session/create', to: 'session#create'
  get 'welcome', to: 'session#show', as: :welcome
  get 'about', to: 'session#about', as: :about
  
  get 'users/new', to: 'users#new'
  get '/', to: 'lists#index'
  root 'users#show'
  post 'users/create', to: 'users#create'

  get 'lists/new', to: 'lists#new'
  get 'lists/create', to: 'lists#create'
  get 'lists/show', to: 'lists#show'
  get 'lists/index', to: 'lists#index'
  get 'lists/:id', to: 'lists#destroy'


  post 'list_items/create', to: 'list_items#create'
  get 'list_items/destroy', to: 'list_items#destroy'









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
