Rails.application.routes.draw do
  root 'sessions#welcome'
  get '/welcome', to: 'users#welcome'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback', to: 'sessions#create'



  resources :users do
    resources :projects, only: [:show, :index, :new]
  end

  resources :projects do
    resources :project_updates
  end
  resources :hobbies
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
