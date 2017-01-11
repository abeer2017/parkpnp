Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  get 'welcome/index'

  root 'parking_spaces#index'
  root to: "home#index"

  resources :parking_spaces

  resources :user do
    resources :bookings
    resources :requests
  end

  get 'requests/:id', to: 'requests#delete', as: :cancel_request

  resources :charges

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
