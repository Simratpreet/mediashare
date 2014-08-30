Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :users do
  	resources :media
  	resources :news_feeds
  end
  root to: "users#index"

end
