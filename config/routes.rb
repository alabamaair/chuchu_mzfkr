Rails.application.routes.draw do
  resources :trains do
    resources :wagons, shallow: true
    resources :coupe_wagons, controller: 'wagons', type: 'CoupeWagon', shallow: true
    resources :sitting_wagons, controller: 'wagons', type: 'SittingWagon', shallow: true
    resources :economy_wagons, controller: 'wagons', type: 'EconomyWagon', shallow: true
    resources :lux_wagons, controller: 'wagons', type: 'LuxWagon', shallow: true
  end
  resources :railway_stations do
    patch :update_index_station, on: :member
  end
  resources :routes
  resources :tickets, only: [:new, :create, :show]
  resource :search, only: [:create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
