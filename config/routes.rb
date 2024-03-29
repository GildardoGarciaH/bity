Rails.application.routes.draw do
  resources :employees
  resources :offices
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  root 'home#index'
  get 'home/index'
  get 'offices/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
