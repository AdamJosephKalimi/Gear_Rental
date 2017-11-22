Rails.application.routes.draw do

# How does this routing play in with the front end,
# considering we want to have the review appear on
# the "gears" show page? Waiting to hear back from Sergio on this.

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'gears#index'

  get '/dashboard', to: "pages#dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :gears do
    resources :bookings, only: [:create, :show, :destroy, :update, :new, :edit] do
      resources :reviews, only: [:create]
    end
    collection do
      get 'search'
    end
  end

#get '/gears/search', to: 'gears#search', as: 'search'



end
