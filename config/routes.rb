EffortlessSite::Application.routes.draw do

  # Get requests
  # Site
  get 'sites' => 'sites#index'
  get 'sites/index'
  get 'sites/new_site'
  get 'sites/:id/edit_site' => 'sites#edit_site', as: :edit_site
  get 'sites/:id/edit_site_details' => 'sites#edit_site_details', as: :edit_site_details
  get 'sites/get_themes/:template_id' => 'sites#get_themes'

  # Template
  get 'templates' => 'html_template#index'

  # Menu
  get 'site/:site_id/menus' => 'menu#index', as: :site_menu_list
  get 'site/:site_id/new_menu' => 'menu#new_menu', as: :new_site_menu
  get 'site/:site_id/edit_menu/:menu_id' => 'menu#edit_menu', as: :edit_site_menu

  # Pages
  get 'site/:site_id/pages' => 'pages#index', as: :site_page_list
  get 'site/:site_id/new_page' => 'pages#new_page', as: :new_site_page
  get 'site/:site_id/edit_page/:page_id' => 'pages#edit_page', as: :edit_site_page

  # Post requests
  # Site
  post 'sites/create_site'
  post 'sites/:id/update_site' => 'sites#update_site', as: :update_site
  post 'sites/:id/update_site_details' => 'sites#update_site_details', as: :update_site_details

  # Template
  post 'html_template/image' => 'html_template#image'

  # Menu
  post 'site/:site_id/menu/create_menu' => 'menu#create_menu', as: :create_menu
  post 'site/:site_id/menu/:id/update_menu' => 'menu#update_menu', as: :update_menu
  post 'site/:site_id/menu/:id/change_status_to/:status' => 'menu#change_menu_status'

  # Pages
  post 'site/:site_id/pages/create_page' => 'pages#create_page', as: :create_page
  post 'site/:site_id/pages/:id/update_page' => 'pages#update_page', as: :update_page

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
