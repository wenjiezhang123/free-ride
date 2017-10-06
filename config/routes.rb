Rails.application.routes.draw do
  get 'sessions/new'

  get 'welcome/index'
  root 'welcome#index'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create' 
  delete '/logout', to: 'sessions#destroy'

  resource :users
  resource :posts
  resource :messages
  post '/messages/create', to: 'messages#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
