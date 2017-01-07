Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    get '/dashboard', to: 'dashboard#dashboard', as: 'dashboard'
    resources :trains do
      resources :wagons, shallow: true
      resources :coupe_wagons, controller: 'wagons', type: 'CoupeWagon', shallow: true
      resources :sitting_wagons, controller: 'wagons', type: 'SittingWagon', shallow: true
      resources :economy_wagons, controller: 'wagons', type: 'EconomyWagon', shallow: true
      resources :lux_wagons, controller: 'wagons', type: 'LuxWagon', shallow: true
    end
    resources :railway_stations do
      patch :update_index_station, on: :member
      patch :update_time_station, on: :member
    end
    resources :routes
  end

  resources :tickets
  resource :search, only: [:create, :show]
  root to: "searches#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
