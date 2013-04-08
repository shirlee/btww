Btww1::Application.routes.draw do

  get '/contest_ended' => 'greetings#contest_ended', :as => :contestended

  get '/index' => 'greetings#index'
  get '/forgot-password' => 'greetings#forgot-password'
  post '/forgot-password' => 'users#reset_password'

  get '/activate' => 'greetings#activate', :as => :activate


  root :to => 'teams#index'
  
  get '/users/:id/chooseteam' => 'users#edit', :as => :chooseteam
  get '/users/:id/completeprofile' => 'users#completeprofile', :as => :completeprofile
  get '/users/:id/surveyinfo' => 'users#surveyinfo', :as => :surveyinfo
  get '/users/activate' => 'users#activate', :as => :activate_account

  match '/auth/:facebook/callback', to: 'sessions#fb_auth'

  resources :sessions
  
  get '/logout' => 'sessions#destroy', :as => :logout
  
  get '/reports' => 'reports#index', :as => :reports
  get '/reports/commute-comments' => 'reports#commute_comments'
  get '/reports/commute-comments/wordcloud' => 'reports#wordcloud'
  
  get '/reports/teams' => 'reports#teams', :as => :teamsreport
  get '/reports/users' => 'reports#users', :as => :usersreport
  
  get '/reports/team_report' => 'reports#team_report', :as => :teamcsvfile
  get '/reports/user_report' => 'reports#user_report', :as => :usercsvfile

  resources :awards

  resources :commutes

  get '/teams/count' => 'teams#team_count', :as => :teamcount

  resources :teams

  resources :users do
    resources :commutes
  end




  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
