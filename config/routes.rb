# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  resources :posts do
    resources :comments, only: %i[create destroy]
  end

  resources :projects do
    resources :chapters, only: %i[create destroy]
  end
end
