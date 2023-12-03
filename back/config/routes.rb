# frozen_string_literal: true

Rails.application.routes.draw do
  # mount_devise_token_auth_for 'User', at: 'auth'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :contacts

  # namespace :api do
  #   scope :v1 do
  #     mount_devise_token_auth_for 'User', at: 'auth' , controllers: {
  #             registrations: 'api/v1/auth/registrations',
  #             sessions: 'api/v1/auth/logins'
  #         }
  #   end
  # end

  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'api/auth/registrations',
      sessions: 'api/auth/logins'
    }
  end

  require 'sidekiq/web'

  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == 'admin' && password == 'admin'
  end
  mount Sidekiq::Web => '/sidekiq'
end
