# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :calculations, only: [] do
      post :add, on: :collection
    end
  end

  root "home#index"
end
