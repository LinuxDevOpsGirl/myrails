Rails.application.routes.draw do
  resources :recipes
  
  resources :films
  
  resources :films do
    resources :sections
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
