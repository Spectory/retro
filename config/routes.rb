Rails.application.routes.draw do
  devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :notes
  resources :meetings
  resources :action_items
  get '/', to: 'meetings#show', defaults: { selected: 'none' }
  root 'meetings#show'

end
