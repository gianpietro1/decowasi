Rails.application.routes.draw do
  
  get 'projects/new'

  get 'projects/edit'

  resources :sliders, except: [:show]
  resources :featureds, except: [:show]
  resources :projects
  resources :favorites, only: [:create, :destroy]

  devise_for :users, controllers: { registrations: "registrations" }
  resources :users, only: [:update, :show]

  root to: 'home#index'

  post '/like' => 'projects#like'
  post '/unlike' => 'projects#unlike'

  post '/favorite' => 'projects#favorite'
  post '/unfavorite' => 'projects#unfavorite'

  post '/follow' => 'users#follow'
  post '/unfollow' => 'users#unfollow'

  get '/plans' => 'home#plans'
  get '/professionals' => 'home#index_professionals'

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
