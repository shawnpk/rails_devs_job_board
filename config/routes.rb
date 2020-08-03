require 'sidekiq/web'

Rails.application.routes.draw do
  resources :jobs
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  mount SimpleDiscussion::Engine => '/forum'

  devise_for :users
  root to: 'home#index'
end
