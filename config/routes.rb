Xmlsoccer::Application.routes.draw do
  get "soccer_stats/home"
  get "soccer_stats/index"
  get "soccer_stats/leagues"
  get "soccer_stats/teams"
  get "soccer_stats/scores"
  # get "soccer_stats/reports"
  resources :soccer_stats do
    member do
      get :reports
    end
  end
  get "soccer_stats/reportsXX"
  get "soccer_stats/earliest_match_dates"
  resources :leagues
  resources :teams
  resources :fixtures do
    member do
      get :report
    end
  end
  get  "dropbox/main"
  post "dropbox/upload"
  get  "dropbox/auth_start"
  get  "dropbox/auth_finish"
  get  "dropbox/push"

  # match "dropbox/auth_finish" => redirect("http://localhost:3000/dropbox/auth_finish?action=auth_finish&controller=dropbox"), via: [:get, :post]
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
