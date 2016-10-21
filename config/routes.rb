Rails.application.routes.draw do
  devise_for :users
  root 'page#index'
  get 'admin' => 'admin#index'
  resources :carts
  resources :restaurants do
    post 'order' => 'restaurants#order'
  end
  resources :admin
  namespace :admins do
    get '/foods/find' => 'foods#find_type'
    post '/search' => 'list_types#search'
    get '/types/' => 'list_types#home'
    get '/foods' => 'foods#home'
    post 'foods/search' => 'foods#search'
  	resources :restaurants do
  		resources :list_types do
        resources :foods
      end
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
