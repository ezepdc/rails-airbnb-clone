Rails.application.routes.draw do
  get 'bookings/new'
  devise_for :users
  root to: "pages#home"
  resources :flats do
    resources :bookings, only: [:new, :create]
  end
end
