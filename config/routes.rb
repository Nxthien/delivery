Rails.application.routes.draw do
  devise_for :users
  root 'page#index'
  get 'admin' => 'admin#index'
  resources :admin
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
