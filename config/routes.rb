Rails.application.routes.draw do

  root "index#index"

  resources :blog, only: %i[index show], constraints: { id: /[^.]+/ }

  resources :testing_labs, only: %i[index]

  namespace :testing_labs do
    resources :hexa_pdf, only: %i[index]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
