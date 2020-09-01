require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  mount SimpleDiscussion::Engine => '/forum'

  devise_for :users
  resources :jobs
  root to: 'jobs#index'
end
