module PublicRecipesHelper
  def total_price(recipe)
    sum = 0
    recipe.recipe_foods.each { |ingredient| sum += (ingredient.food.price * ingredient.quantity) }
    sum
  end
end
