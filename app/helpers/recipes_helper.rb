module RecipesHelper
  def user?(recipe, id)
    recipe.user_id == id
  end
end
