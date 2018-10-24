Rails.application.routes.draw do
  resources :events
  resources :user_groups
  resources :groups
  resources :users

  post '/login', to: 'users#login'
  post '/places', to: 'fetch#places'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
