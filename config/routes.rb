Rails.application.routes.draw do
  resources :user, only: %i[index show]
  devise_for :users, :controllers => { registrations: 'registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events
  resources :going_to_event, only: %i[update destroy]
  post '/going_to_event/:id', to: 'going_to_event#attend', as: 'attend'
  post '/going_to_event/:id', to: 'going_to_event#unattend', as: 'unattend'

  # Defines the root path route ("/")
  root "events#index"
end
