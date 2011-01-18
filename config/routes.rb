BandNotifier::Application.routes.draw do
  get "public/index"
  get "public/about"

  resources :user_sessions

  resources :users

  resources :members

  match '/events/upcoming', :to => 'events#upcoming_events', :as => 'upcoming'
  match '/events/notify/:id', :to => 'events#mail_notify', :as => 'events_notify'
  resources :events
  
  match '/login', :to => 'user_sessions#new'
  match '/logout', :to => 'user_sessions#destroy'
  root :to => 'public#index'
end
