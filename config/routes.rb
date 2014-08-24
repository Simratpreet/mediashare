Rails.application.routes.draw do
  devise_for :users
  resources :users do
  	resources :media
  end
  root to: "users#index"

end
