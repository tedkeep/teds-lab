Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login', sign_out: 'logout',
    password: 'secret', confirmation: 'verification',
    registration: 'register', edit: 'edit/profile'
  }

  namespace :blog do
    resources :posts
  end

  root "index#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
