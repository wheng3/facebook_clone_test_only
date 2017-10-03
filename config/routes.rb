Rails.application.routes.draw do
	resources :users
	resources :statuses
	resources :likes, only: [:create, :destroy, :index]
	resources :sessions, only: [:new, :create, :index]
	root 'welcome#index'
	get "log_out" => "sessions#destroy", as: "logout"
end
