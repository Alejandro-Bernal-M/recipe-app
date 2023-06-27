Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "recipes#index"
  get '/recipes', to: 'recipes#index'
  get '/recipes/:id', to: 'recipes#show', as: 'recipe'
  delete '/recipes/:id', to: 'recipes#destroy', as: 'delete_recipe'
end
