Rails.application.routes.draw do
  
  get 'friends/index'
  get 'friends/addfriend/:friend_id' => 'friends#addfriend', as: :friends_addfriend
  get 'friends/myfriend'

  get 'messages/index'

  get 'sessions/create'

  root 'welcome#index'
  get 'welcome/index'
  get 'signup' => "users#new"
  get 'login' => "sessions#new"
  post 'login' => "sessions#create"
  get 'signout' => "sessions#destroy"

  get 'messages' => 'messages#index'
  get 'messages/sent' => 'messages#sent'
  get 'messages/new' => 'messages#new'
  post 'messages' => 'messages#sending'
  get 'messages/:message_id/content' => 'messages#content', as: :messages_content

  post 'users/updateprofile' => 'users#updateprofile'
  get 'users/profile' => 'users#profile'


  resources :users


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
