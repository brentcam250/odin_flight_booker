Rails.application.routes.draw do
  resources :passengers
  resources :bookings
  resources :airports
  resources :flights
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'flights#index'
end
