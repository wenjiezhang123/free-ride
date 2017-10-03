Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'

  resource :users
  resource :posts
  post '/messages/create', to: 'messages#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
