  Rails.application.routes.draw do
    post '/auth/login', to: 'authentications#login'
    get 'auth/verify', to: 'authentications#verify'
    
    resources :users, only: :create
    # resources :students
    # resources :volunteers
    resources :events do
      resources :volunteers, shallow: true 
        resources :students, shallow: true 
        end
  
    resources :registrations
  
    resources :mentorings
    get "tags/data", to: "mentorings#default_values"
  
end
