class RecipesFoodController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.all
  end

  def create
    @recipe_food = RecipeFood.create(recipe_food_params)
  
    if @recipe_food.save
      redirect_to recipe_path(params[:recipe_id])
    else
      flash[:alert] = "Recipe Food was not created, try again."
      redirect_to recipe_path(@recipe)
    end
  end
  

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(params[:recipe_id])
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.update(recipe_food_params_update)
    redirect_to recipe_path(params[:recipe_id])
  end

  private

  def recipe_food_params
    params.permit(:recipe_id, :food_id, :quantity)
  end

  def recipe_food_params_update
    params.require(:recipe_food).permit(:quantity)
  end
end
