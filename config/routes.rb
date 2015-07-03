Rails.application.routes.draw do
  devise_for :admins, :controllers => { registrations: 'registrations' }
  root 'pages#home'
  
  scope format: false do
    # get '/:year/*month/*day/*title', to: 'blog_posts#show', constraints: { year: /(19|20)\d{2}/}
    get '/*date/*title', to: 'blog_posts#show', date: %r[\d{4}/\d{2}/\d{2}], as: 'post'
  end
  # scope "/blog" do
  #   resources :year, controller: :blog_posts, only: :show, path: "" do
  #     resources :month, controller: :blog_posts, only: :show, path: "" do
  #       resources :day, controller: :blog_posts, only: :show, path: "" do
  #         resources :title, controller: :blog_posts, only: :show, path: ""
  #       end
  #     end
  #   end
  # end
  resources :blog_posts
  resources :blog_categories
  resources :applications
  resources :faqs
  resources :contacts
  resources :mini_courses
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
