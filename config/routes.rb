Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "recipes#index"
  get '/recipes', to: 'recipes#index'
  post '/recipes', to: 'recipes#create', as: 'create_recipe'
  get '/recipes/new', to: 'recipes#new', as: 'new_recipe'
  get '/recipes/:id', to: 'recipes#show', as: 'recipe'
  patch 'recipes/:id/update_public', to: 'recipes#update_public', as: 'update_recipe_public'
  delete '/recipes/:id', to: 'recipes#destroy', as: 'delete_recipe'
  get '/foods', to: 'foods#index'
  get '/foods/new', to: 'foods#new', as: 'new_food'
  post '/foods/new', to: 'foods#create', as: 'create_food'
  delete '/foods/:id', to: 'foods#destroy', as: 'delete_food'

  get 'recipes/:recipe_id/foods/new', to: 'recipes_food#new', as: 'new_recipe_food'
  post 'recipes/recipe_food/new', to: 'recipes_food#create', as: 'create_recipe_food'
  delete 'recipes/:recipe_id/foods/:id', to: 'recipes_food#destroy', as: 'delete_recipe_food'
  get 'recipes/:recipe_id/foods/:id/edit', to: 'recipes_food#edit', as: 'edit_recipe_food'
  patch 'recipes/:recipe_id/foods/:id/edit', to: 'recipes_food#update', as: 'update_recipe_food'
end
