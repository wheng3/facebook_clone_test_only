Rails.application.routes.draw do
	resources :users
	resources :statuses
	resources :likes, only: [:create, :destroy]
	resources :sessions
	root 'welcome#index'
end
