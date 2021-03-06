Rails.application.routes.draw do
  root to: 'groups#index'

  namespace :admin do
    root to: 'events#index'

    resources :events
    resources :groups
  end

  get '/groups/:id', to: redirect('/%{id}') # rubocop:disable Style/FormatStringToken
  get '/groups/:id/ical', to: redirect('/%{id}/ical') # rubocop:disable Style/FormatStringToken

  resources :groups, path: '', only: %i[index show] do
    get '/ical', to: 'calendars#show'
  end
end
