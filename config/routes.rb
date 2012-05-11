Uniqcolor1::Application.routes.draw do
  

  devise_for :users,:controllers => { :registrations => "user/registrations",
                                       :sessions => "user/sessions",
                                       :confirmations => "user/confirmations",
                                       :passwords => "user/passwords"} do
    match '/logout' => 'user/sessions#destroy'
    match "/sign_up" => "user/registrations#create", :as => :signup
    get "/users/sign_in" => "user/sessions#new", :as => :sign_in_out
    post "/users/sign_in" => "user/sessions#create"
    put "/users/sign_in" => "user/sessions#create"
    match  "/user/:id/edit_account" => "user/registrations#edit_account", :as => :edit_account
  end

  get "home/index"
  root :to => "home#index"
  get 'dashboard' => 'home#dashboard', :as => :dashboard
  get 'edit' => 'home#edit', :as => :edit
  get 'new' => 'home#new', :as => :new
  post 'home/upload_image'
  get 'home/userdetails'

  resources :comments
  post 'home/friend_invite'
  match "/:home_perma_link" => 'home#show'
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
