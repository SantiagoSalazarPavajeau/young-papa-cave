Rails.application.routes.draw do
  root 'sessions#welcome'
  get '/welcome', to: 'users#welcome'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'



  resources :projects
  resources :hobbies
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
