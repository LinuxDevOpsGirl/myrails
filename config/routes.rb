Rails.application.routes.draw do

  root to:'homes#index'

  resources :recipes
  
  resources :films
  
  resources :films do
    resources :sections
  end

  resources :companies
  resources :people

  resources :user_sessions
  resources :users



  # get replaces match
  get 'login', :to => 'user_sessions#new', :as => 'login'
  get 'logout', :to => 'user_sessions#destroy', :as => 'logout'
  get 'register/:activation_code', :to => 'activations#new', :as => 'register'
  match 'activate/:id', :to => 'activations#create', :as => 'activate', via: [:get, :post]
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
