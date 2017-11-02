Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :edit_plays
  resources :plays
  get '/users/:id' => 'users#show', :as => :user
  get '/plays/show'
  get 'home/homepage'
  root 'home#homepage'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
