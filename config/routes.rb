Rails.application.routes.draw do
	get 'forum/index'

  resources :users, except: [:create]
  resources :user_forms, only: [:create]

	resources :topics do
		resources :posts
  end

	get 'sessions/new', to: 'sessions#new'
	post 'sessions/create', to: 'sessions#create'
	delete 'sessions/destroy', to: 'sessions#destroy'

	root 'forum#index'
end
