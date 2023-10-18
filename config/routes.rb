Rails.application.routes.draw do
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

  get '/suggestions', to: 'suggestions#index'

end
