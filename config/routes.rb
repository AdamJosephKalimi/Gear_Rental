Rails.application.routes.draw do
  resources :bookings, only: [:create, :show, :destroy, :update]

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :gears

end
