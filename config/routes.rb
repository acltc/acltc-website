Rails.application.routes.draw do
  root 'pages#home'
  devise_for :admins, :controllers => { registrations: 'registrations' }
  get 'admins/dashboard' => 'admins#dashboard'

  scope format: false do
    get '/*date/*title', to: 'blog_posts#show', date: %r[\d{4}/\d{2}/\d{2}], as: 'post'
  end

  get '/pages/thank_you'
  get '/pages/contacts_thank_you'

  resources :blog_posts
  resources :blog_categories
  resources :applications
  resources :faqs
  resources :contacts
  resources :mini_courses
  resources :mini_course_applications
  resources :subscribers, :only => [:create, :index]
  resources :capstones, only: [:index]
  resources :screencasts, only: [:index]
  resources :diversity_applications, only: [:index]
  resources :interviews

  get "/options/" => "interviews#interview_options"
  get "/apply" => "subscribers#apply"
  
  get "/tutorial/lessons" => "lessons#index"
  get "/tutorial/lessons/:title" => "lessons#show"

  get "/tutorial_submissions" => "tutorial_submissions#index"
  post "/tutorial_submissions" => "tutorial_submissions#create"
  patch "/tutorial_submissions/ajax" => "tutorial_submissions#ajax_update"
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
