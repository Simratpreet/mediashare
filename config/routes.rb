Rails.application.routes.draw do
	resources :friendships do
		member do
			get 'accept'
			get 'reject'
		end
	end
	devise_for :admin_users, ActiveAdmin::Devise.config
	ActiveAdmin.routes(self)
	devise_for :users
	resources :users do
		resources :media
  	resources :news_feeds
	end
	root to: "users#index"
end
