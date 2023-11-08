Rails.application.routes.draw do
  # include ExceptionHandling
  # not working
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :users do
    resources :users ,as: 'direct'
  end

  resources :job_profiles, except: [:new, :edit]
  resources :user_profiles, except: [:new, :edit]  
  resources :companies, except: [:new, :edit]

  get '/suggestions', to: 'suggestions#user'

end
