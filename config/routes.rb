Rails.application.routes.draw do
  get 'sessions/new'

  get 'welcome/index'
  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  patch '/change_status/:id', to: 'users#change_status'

  resources :users
  resources :posts
  resources :messages
  post '/messages/create', to: 'messages#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
