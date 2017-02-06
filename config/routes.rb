Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'subscribers_popup' => 'subscribers#create_from_popup'
    end
  end
  
  get 'statuses/show'

  get 'statuses/edit'

  root 'pages#home'
  devise_for :admins, :controllers => { registrations: 'registrations' }
  get 'admins/dashboard' => 'admins#dashboard'

  scope format: false do
    get '/*date/*title', to: 'blog_posts#show', date: %r[\d{4}/\d{2}/\d{2}], as: 'post'
  end

  get '/pages/thank_you'
  get '/pages/contacts_thank_you', :as => :contacts_thank_you
  get "/tours/thank_you" => "tours#thank_you", :as => :tours_thank_you
  get '/pages/scholarship_thank_you'
  get '/corporate_training' => 'corporate_training_messages#corporate_training', :as => :corporate_training
  get '/corporate_training_thank_you' => 'corporate_training_messages#thank_you', :as => :corporate_training_thank_you

  get "/apply" => "subscribers#apply", :as => :new_application #new_application_path has been altered for split test
  get "/applications/new/:id" => "applications#new"

  get "/subscribers/download"
  
  post 'subscribers_application' => 'subscribers#create_from_application'
  post 'subscribers_popup' => 'subscribers#create_from_popup'
  post 'subscribers_curriculum' => 'subscribers#create_from_curriculum'
  post 'subscribers_tutorial' => 'subscribers#create_from_tutorial'
  post 'subscribers_footer' => 'subscribers#create_from_footer'
  
  resources :blog_posts
  resources :blog_categories
  resources :applications
  resources :lakewood_applications
  resources :statuses, only: [:edit, :update]
  resources :faqs
  resources :contacts
  resources :mini_courses
  resources :mini_course_applications
  resources :subscribers, :only => [:index]
  resources :capstones, only: [:index]
  resources :screencasts, only: [:index]
  resources :interviews
  resources :corporate_training_messages, only: [:index, :new, :create, :show]
  resources :tours
  resources :info_session_sign_ups
  resources :info_sessions

  get "/careers" => "job_openings#index", as: :careers

  get "/options/" => "interviews#interview_options"
  
  get "/tutorial/lessons" => "lessons#index"
  get "/tutorial/lessons/:title" => "lessons#show"

  get "/tutorial_submissions" => "tutorial_submissions#index"
  post "/tutorial_submissions" => "tutorial_submissions#create"
  patch "/tutorial_submissions/ajax" => "tutorial_submissions#ajax_update"

  get "/profiles" => "profiles#index"
  patch "/profiles/:id" => "profiles#update"
  post "/profiles" => "profiles#create"
  get "/profiles/:id" => "profiles#modal"

  get "/lakewood_profiles" => "lakewood_profiles#index"
  patch "/lakewood_profiles/:id" => "lakewood_profiles#update"
  post "/lakewood_profiles" => "lakewood_profiles#create"
  get "/lakewood_profiles/:id" => "lakewood_profiles#modal"

  get "/referrals" => "referrals#index"
  get "/referrals/new" => "referrals#new", :as => :new_referral
  post "/referrals" => "referrals#create"
  get "/referrals/thank_you" => "referrals#thank_you"
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
