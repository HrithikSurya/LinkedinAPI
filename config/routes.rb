Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :users do
  get '/user_details', to: 'users#index'
  end

  resources :job_profiles, except: [:new, :edit]
  resources :companies, except: [:new, :edit]

end
