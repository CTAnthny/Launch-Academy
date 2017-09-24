Rails.application.routes.draw do
  resources :horses
  resources :cars, only: [:index]
  resources :trains, only: [:index]
  resources :airplanes, only: [:index]
end
