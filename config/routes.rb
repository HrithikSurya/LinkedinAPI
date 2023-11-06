Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :users do
    resources :users ,as: 'direct'
  end

  get 'job_profiles/:page', to: 'job_profiles#index'
  resources :job_profiles, except: [:index, :new, :edit]
 
  get 'user_profiles/:page', to: 'user_profiles#index'
  resources :user_profiles, except: [:index, :new, :edit]
  
  resources :companies, except: [:new, :edit]

  get '/suggestions', to: 'suggestions#user'

end
