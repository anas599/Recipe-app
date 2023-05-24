Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  resources :recipe_foods
  resources :foods
  resources :users
  resources :public_recipes, only: [:index]
  root "foods#index"

  get '/general_shopping_list', to: 'recipes#general_shopping_list'

end
