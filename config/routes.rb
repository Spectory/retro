Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :notes
root 'static_pages#home'
# get 'static_pages/home'
# get '/robots.txt', to: 'application#robots'

end
