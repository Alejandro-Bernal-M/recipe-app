class ShoppingListController < ApplicationController
  before_action :set_user
  include ShoppingListHelper
  def index
    @recipes = Recipe.where(user_id: current_user.id)
    @foods = Food.where(user_id: current_user.id)

    # Transform recipes and required foods into a flat list of required items
    @required_foods = @recipes.flat_map do |recipe|
      recipe.recipe_foods.map do |recipe_food|
        food = recipe_food.food
        food[:quantity] = recipe_food.quantity
        food
      end
    end

    stock_hash = @foods.to_h { |food| [food.name, food.quantity] } # Hash of available food items and their quantities.

    # compare required foods to available foods and add missing foods to the shopping list
    @missing_foods = diff_in_stock(stock_hash, @required_foods)

    @combined_foods = combine_foods(@missing_foods)

    @total_price = helpers.calculate_total_price(@combined_foods)
  end
end
