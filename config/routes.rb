Rails.application.routes.draw do
  resources :borough_postcodes
  resources :postcodes
  resources :boroughs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
