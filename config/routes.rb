Gonpy::Application.routes.draw do
  
  resources :bids

  get "search/index"

  resources :categories

  resources :requests

  resources :services
  resources :pictures
  get "proaccounts/new"
  get "proaccounts/create"
  get "proaccounts/edit"
  get "proaccounts/update"
  get "proaccounts/edit_service"
  get "proaccounts/photo"
  get "proaccounts/edit_photo"
  #get "proaccounts/crop"
  get "proaccounts/settings"
  get "home/index"
  match 'postrequest' => 'postrequest#new'
  get "postrequest/create"
  get "requests/new"
  get "requests/direct"
  get "inbox/receive"
  get "inbox/sendmail"
  get "inbox/index"
  get "request/create_bid"
  match 'inbox' => 'inbox#index'
  #get "requests/autocomplete_category_libelle_category"
  
  #devise_for :users #, :controllers => {:registrations => "registrations"}
  devise_for :users, :controllers => {:registrations => "registrations"}
  #devise_scope :user do
  #    root :to => "registrations#new"
  #end 
  devise_for :professionals

      
  resources :proaccounts,:address
  root :to => "home#index"
  match 'home' => 'home#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
