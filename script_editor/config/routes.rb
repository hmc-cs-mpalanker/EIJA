Rails.application.routes.draw do
  post 'cuts/new'
  post 'cuts/delete'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :edit_plays
  resources :plays
  resources :edits
  get '/users/:id' => 'users#show', :as => :user
  get '/makenewedit/:id' => 'edits#new'
  get '/plays/show'
  get '/edits/show'
  get 'home/homepage'
  root 'home#homepage'
  get 'pages/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
