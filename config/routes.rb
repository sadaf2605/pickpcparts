Rails.application.routes.draw do
  resources :cpus

  resources :form_factors

  resources :cpu_cases

  resources :power_supplies

  resources :video_cards

  resources :storages

  resources :memories

  resources :memory_slots

  resources :builds

  resources :motherboards

  resources :coolers

  resources :cpu_sockets

  root 'builds#index'

  get 'current_build' => 'builds#current_build', :as=>'current_build'
  post 'builds/cpu/:cpu_id' => 'builds#add_cpu', :as => 'add_cpu'
  post 'builds/motherboard/:motherboard_id' => 'builds#add_motherboard', :as => 'add_motherboard'
  post 'builds/cooler/:cooler_id' => 'builds#add_cooler', :as => 'add_cooler'
  post 'builds/memory/:memory_id' => 'builds#add_memory', :as => 'add_memory'
  post 'builds/storage/:storage_id' => 'builds#add_storage', :as => 'add_storage'
  post 'builds/video_card/:video_card_id' => 'builds#add_video_card', :as => 'add_video_card'
  post 'builds/cpu_case/:cpu_case_id' => 'builds#add_cpu_case', :as => 'add_cpu_case'
  post 'builds/power_supply/:power_supply_id' => 'builds#add_power_supply', :as => 'add_power_supply'

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
