Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :users do
    # get '/user', to: 'users#index'
    resources :users
  end

  resources :job_profiles, except: [:new, :edit]
  resources :user_profiles, except: [:new, :edit]
  resources :companies, except: [:new, :edit]

end
