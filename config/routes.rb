Rails.application.routes.draw do
  devise_for :views
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'page#index'
  get 'admin' => 'admin#index'
  post 'search' => 'page#search'
  resources :carts
  get 'search_type' => 'restaurants#search_type'
  resources :restaurants do
    post 'order' => 'restaurants#order'
  end
  get 'user_list_cart' => 'carts#user_list_cart'
  resources :admin
  put '/update_cart' => 'admin#update_cart'
  namespace :admins do
    get '/foods/find' => 'foods#find_type'
    post '/search' => 'list_types#search'
    get '/types/' => 'list_types#home'
    get '/foods' => 'foods#home'
    post 'foods/search' => 'foods#search'
    get 'carts' => 'carts#index'
    resources :users
  	resources :restaurants do
  		resources :list_types do
        resources :foods
      end
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
