Rails.application.routes.draw do

  resources :displays
  resources :coolers

  resources :blog, :controller=>"build_posts"
      
  
  

  resources :featured_blog_posts

  resources :products


#  mount Blogit::Engine => "/blog" , :as => 'blogit'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
match "/admin/featuredpost" => 'admin/featuredpost#add_event', via: :post, as: "featured_posts"
  
  #post 'admin/featuredpost' => ActiveAdmin::RoutesBuilder.routes.featuredpost, :as=>'admin_featuredpost'
  ActiveAdmin.routes(self)
  
  

  root 'pages#front'
  resources :pages
  get 'about' =>'pages#about'
  
  get 'search/auto_complete_search' => 'search#auto_complete_search', :as=>'auto_complete_search'
  get 'search' => 'search#search', :as=>'search'
  
  
  scope :builds do
    get 'current' => 'builds#current_build', :as=>'current_build'
    get 'new' => 'builds#new_build', :as=>'new_build'

    get ':token' => 'builds#token_build', :as=>'token_build'
    
    scope :add do
      post 'cpu/:cpu_id'                    => 'builds#add_cpu',          :as => 'add_cpu'
      post 'motherboard/:motherboard_id'    => 'builds#add_motherboard',  :as => 'add_motherboard'
      post 'cooler/:cooler_id'              => 'builds#add_cooler',       :as => 'add_cooler'
      post 'memory/:memory_id'              => 'builds#add_memory',       :as => 'add_memory'
      post 'storage/:storage_id'            => 'builds#add_storage',      :as => 'add_storage'
      post 'video_card/:video_card_id'      => 'builds#add_video_card',   :as => 'add_video_card'
      post 'cpu_case/:cpu_case_id'          => 'builds#add_cpu_case',     :as => 'add_cpu_case'
      post 'power_supply/:power_supply_id'  => 'builds#add_power_supply', :as => 'add_power_supply'
      post 'optical_drive/:optical_drive_id'=> 'builds#add_optical_drive',:as => 'add_optical_drive'
    end

    scope :remove do
      post 'cpu/:cpu_id'                    => 'builds#remove_cpu',           :as => 'remove_cpu'
      post 'motherboard/:motherboard_id'    => 'builds#remove_motherboard',   :as => 'remove_motherboard'
      post 'cooler/:cooler_id'              => 'builds#remove_cooler',        :as => 'remove_cooler'
      post 'memory/:memory_id'              => 'builds#remove_memory',        :as => 'remove_memory'
      post 'storage/:storage_id'            => 'builds#remove_storage',       :as => 'remove_storage'        
      post 'video_card/:video_card_id'      => 'builds#remove_video_card',    :as => 'remove_video_card'
      post 'cpu_case/:cpu_case_id'          => 'builds#remove_cpu_case',      :as => 'remove_cpu_case'
      post 'power_supply/:power_supply_id'  => 'builds#remove_power_supply',  :as => 'remove_power_supply'
      post 'optical_drive/:optical_drive_id'=> 'builds#remove_optical_drive', :as => 'remove_optical_drive'
    end 

  end


  resources :cpus

  resources :form_factors

  resources :cpu_cases

  resources :power_supplies

  resources :video_cards

  resources :storages

  resources :memories

  resources :memory_slots

#  resources :builds

  resources :motherboards


  resources :cpu_sockets


  resources :optical_drives







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
