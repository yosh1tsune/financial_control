Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :debts, only: %i[new create]
end
