Rails.application.routes.draw do
  # namespace :api do
  #   namespace :v1 do
  #     post '__popup' => 'subscribers#create_from_popup'
  #   end
  # end

  get 'statuses/show'

  get 'statuses/edit'



  root 'pages#home'
  get '/chicago-coding-bootcamp' => 'pages#in_person'
  get '/online-coding-bootcamp' => 'pages#online'
  get '/hiring' => 'pages#hiring'
  post '/hiring' => 'pages#send_to_hiring'
  get '/in-person', to: redirect('/chicago-coding-bootcamp')
  get '/online', to: redirect('/online-coding-bootcamp')
  get '/financing' => 'pages#financing'
  get '/ruby' => 'pages#repl'
  get '/javascript' => 'pages#javascript_repl'

  get '/newsletter/think-like-a-software-engineer' => 'pages#tlase'
  get '/newsletter/learn-to-code-in-60-days' => 'pages#sixty_day'

  devise_for :admins, :controllers => { registrations: 'registrations' }
  get 'admins/dashboard' => 'admins#dashboard'

  scope format: false do
    get '/*date/*title', to: 'blog_posts#show', date: %r[\d{4}/\d{2}/\d{2}], as: 'post'
  end

  get '/sitemap.xml', :to => 'sitemaps#index', :defaults => {:format => 'xml'}

  get '/pages/thank_you'
  get '/pages/webinar_thank_you'
  get '/pages/tlase_thank_you'
  get '/pages/contacts_thank_you', :as => :contacts_thank_you
  get "/tours/thank_you" => "tours#thank_you", :as => :tours_thank_you
  get "/pages/tours/thank_you" => "pages#tour_thank_you", :as => :pages_tours_thank_you
  get '/pages/scholarship_thank_you'
  get '/corporate_training' => 'corporate_training_messages#corporate_training', :as => :corporate_training
  get '/corporate_training_thank_you' => 'corporate_training_messages#thank_you', :as => :corporate_training_thank_you

  get '/privacy_policy' => 'pages#privacy_policy'

  get "/apply" => "subscribers#apply", :as => :new_application #new_application_path has been altered for split test
  get "/applications/new/:id" => "applications#new"

  get "/subscribers/download"
  get "/subscribers/career_pdf_download"

  post 'subscribers_application' => 'subscribers#create_from_started_application'
  post 'subscribers_curriculum' => 'subscribers#create_from_curriculum'
  post 'subscribers_teaching_book' => 'subscribers#create_from_teaching_book'
  post 'subscribers_tutorial' => 'subscribers#create_from_tutorial'
  post 'subscribers_footer' => 'subscribers#create_from_footer'
  post 'subscribers_webinar' => 'subscribers#create_from_webinar'
  post 'subscribers_tlase' => 'subscribers#create_from_tlase'
  post 'subscribers_sixty_day' => 'subscribers#create_from_sixty_day'
  post 'subscribers_blog' => 'subscribers#create_from_blog'
  post 'subscribers_career_pdf' => 'subscribers#create_from_career_pdf'
  post 'subscribers_tour' => 'subscribers#create_from_tour'
  post 'subscribers' => 'subscribers#create_from_tour'
  post 'subscribers_popup' => 'subscribers#create_from_popup'

  resources :blog_posts
  resources :blog_categories
  resources :applications
  resources :scholarships, only: [:new, :create]
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

  get "/videos/think-like-a-software-engineer" => 'videos#tlase_show'
  get "/videos/learn-to-code-in-60-days" => 'videos#sixty_day_show'

  get "/think-like-a-software-engineer/videos" => 'videos#tlase_index'
  post "/think-like-a-software-engineer/videos" => 'videos#tlase_create'
  get "/think-like-a-software-engineer/videos/new" => 'videos#tlase_new'
  get "/think-like-a-software-engineer/videos/:episode_id/edit" => 'videos#tlase_edit'
  patch "/think-like-a-software-engineer/videos/:episode_id" => 'videos#tlase_update'
  get "/think-like-a-software-engineer/videos/:episode_id" => 'videos#new_tlase_show'

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

  get "/referrals" => "referrals#index", :as => :referrals
  get "/referrals/new" => "referrals#new", :as => :new_referral
  post "/referrals" => "referrals#create"
  get "/referrals/thank_you" => "referrals#thank_you"

  get "/coding-bootcamps/community-info" => "pages#communities_index"
  get "/coding-bootcamps/:location/community-info" => "pages#communities"
  get "/codecademy" => "pages#codecademy"
  get "/resources" => "pages#resources"

  get "/codenewbie" => 'pages#codenewbie'
  get "/code-newbie" => 'pages#codenewbie'
  get "/codenewbies" => 'pages#codenewbie'

  post "/social-media" => 'social_media#new_post'

  get "/open_prework" => "open_prework#index"

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
