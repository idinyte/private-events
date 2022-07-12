Rails.application.routes.draw do
  resources :users, only: %i[index show]
  devise_for :users, :controllers => { registrations: 'registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events
  # Defines the root path route ("/")
  root "events#index"
end
