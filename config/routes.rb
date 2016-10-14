Rails.application.routes.draw do
  devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :notes
  resources :meetings
  resources :action_items
  get '/', to: 'meetings#show', defaults: { selected: 'previous_action_items' }
  root 'meetings#show'
  # get 'static_pages/home'
  # get '/robots.txt', to: 'application#robots'

end
