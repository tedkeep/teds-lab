Rails.application.routes.draw do

  resources :blog, only: %i[index show], constraints: { id: /[^.]+/ }

  root "index#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
