BandNotifier::Application.routes.draw do
  resources :members

  match '/events/upcoming', :to => 'events#upcoming_events', :as => 'upcoming'
  match '/events/notify/:id', :to => 'events#mail_notify', :as => 'events_notify'
  resources :events
  root :to => 'events#upcoming_events'
end
