Rails.application.routes.draw do
  root to: "users#home"
  resources :users, :attractions
  get 'signin', to: 'sessions#new', :as => :signin
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'
  post 'take_attraction', to: 'attractions#take_attraction'
end
