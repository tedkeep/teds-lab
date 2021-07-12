Rails.application.routes.draw do
  namespace :blog do
    resources :posts
  end

  root "index#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
