Rails.application.routes.draw do
  resources :cities
  resources :states
  resources :countries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "states/country/:country_id", to: "states#from_country"
#  get "articles/user/:user_id", to: "articles#from_author"



end
