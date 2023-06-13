# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts
  resources :categories
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: "posts#index"
end
