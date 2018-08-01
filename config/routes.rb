# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  namespace :admin do
    root 'posts#index'
    
    resources :posts do
      resources :comments

      member do
        post :publish
      end
    end

    resources :projects do
      resources :chapters
    end
  end

  resources :posts, only: %i[index show] do
    resources :comments, only: %i[create destroy]
  end

  resources :projects, only: %i[index show]
end
