Rails.application.routes.draw do
  get 'scene_render/:id' => 'scene_render#show'

  post 'line_cuts/new'
  post 'line_cuts/delete'

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
  get '/edits/compress'
  get '/edits/compress/:id' => 'edits#compress'
  get 'home/homepage'
  root 'home#homepage'
  get 'pages/about'

  get 'lines/show'
  # get 'lines/script'

   get '/script/:charecterName' => 'lines#script'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
