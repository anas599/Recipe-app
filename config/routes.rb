Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  resources :recipe_foods
  resources :foods
  resources :users
  resources :public_recipes, only: [:index]
  root "foods#index"
end
