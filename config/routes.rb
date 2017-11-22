Rails.application.routes.draw do
  resources :bookings, only: [:create, :show, :destroy, :update] do
    resources :reviews, only: [:create]
  end
# How does this routing play in with the front end,
# considering we want to have the review appear on
# the "gears" show page? Waiting to hear back from Sergio on this.

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  root to: 'gears#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :gears

end
