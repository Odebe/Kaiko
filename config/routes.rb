# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'client/main#index'

  scope module: 'client' do
    get '/main', to: 'main#index'
    resources :users, only: :show

    get '/team', to: 'people#index'
    # resources :people, only: :index

    resources :releases, only: %i[index]

    resources :posts, only: %i[index show] do
      resources :comments, only: %i[create destroy]
    end

    resources :projects, only: %i[index show]
  end

  namespace :admin do
    root 'posts#index'

    resources :users

    resources :people

    resources :releases

    resources :posts do
      resources :comments

      member do
        post :publish
      end
    end

    resources :projects do
      resources :chapters do
        member do
          post :release
        end
      end
    end
  end
end
