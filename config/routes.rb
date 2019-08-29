Rails.application.routes.draw do
  devise_for :users
  root to: "emails#index"

  resources :tasks, except: [:show]
  resources :emails, except: [:edit]
  
	post '/emails', to: 'emails#create', as: 'create_email'
	patch '/emails/:id', to: 'emails#update', as: 'update_email'
	delete '/emails/:id', to: 'emails#destroy', as: 'destroy_email'

  delete '/tasks/:id', to: 'tasks#destroy', as: 'destroy_task'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
