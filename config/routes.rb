Rails.application.routes.draw do

  root 'locations#index'

  post 'locations/show'

  get 'locations/show'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
