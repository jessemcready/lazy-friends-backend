Rails.application.routes.draw do
  resources :events
  resources :user_groups
  resources :groups
  resources :users


  # post '/login', to: 'users#login'
  post '/places', to: 'fetch#places'
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  patch '/groups/:id/leave', to: 'groups#leave'
  post '/mailer', to: 'users#mailer'
  post '/event_invite', to: 'groups#event_invite'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
