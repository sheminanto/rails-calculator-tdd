# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :calculations, only: :create
  end

  root "home#index"
end
