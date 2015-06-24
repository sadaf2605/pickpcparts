Rails.application.routes.draw do
  resources :cpus

  resources :form_factors

  resources :processor

  namespace :processor do
    resources :performances
  end

  namespace :processor do
    resources :memories
  end

  namespace :processor do
    resources :graphics
  end

  namespace :processor do
    resources :expansions
  end

  namespace :processor do
    resources :packages
  end

  namespace :processor do
    resources :data_protections
  end

  namespace :processor do
    resources :platform_protections
  end

  namespace :processor do
    resources :advanced_technologies
  end

  namespace :processor do
    resources :processor_packages
  end

  namespace :processor do
    resources :processors
  end

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
