Rails.application.routes.draw do
  resources :cities
  resources :states
  resources :countries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "states/country/:country_id", to: "states#from_country"

  get "states/cities/:id", to: "states#has_cities"
#  get "articles/user/:user_id", to: "articles#from_author"
  get "countries/stcity/:id", to: "countries#has_states_cities"


end
