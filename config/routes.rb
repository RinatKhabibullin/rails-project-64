# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :posts, only: %i[index create show new] do
    resources :comments, only: [:create]
  end

  root to: 'posts#index'
end
