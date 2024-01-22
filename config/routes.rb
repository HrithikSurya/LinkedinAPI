require 'sidekiq/web'
Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  
  get 'job_applications/index', to: 'job_applications#index'
  get 'job_applications/show/:id', to: 'job_applications#show'

  post 'job_applications/accept_job_application/:id', as: 'accept_job_application',
  to: 'job_applications#accept_job_application'

  post 'job_applications/reject_job_application/:id', as: 'reject_job_application',
  to: 'job_applications#reject_job_application'

  get 'job_applications/view_approved_job_application', to: 'job_applications#view_approved_job_application'
  get 'job_applications/view_rejected_job_application', to: 'job_applications#view_rejected_job_application'
  
  get 'job_applications/applied_job_application', to: 'job_applications#applied_job_application'
  
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
  
  mount Sidekiq::Web => '/sidekiq'
  
end
