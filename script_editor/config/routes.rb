Rails.application.routes.draw do
<<<<<<< HEAD
  get 'cuts/new'

  get 'cuts/delete'

=======
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :edit_plays
>>>>>>> e8a99a2c0e3d7071ae2b80a55d518effea1635e0
  resources :plays
  get '/users/:id' => 'users#show', :as => :user
  get '/plays/show'
  get 'home/homepage'
  root 'home#homepage'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
