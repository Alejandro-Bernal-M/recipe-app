class RecipesController < ApplicationController
  before_action :set_user
  # except: [:create, :new, :update_public]
  include RecipesHelper

  def index
    @recipes = Recipe.where(user_id: @current_user.id)
  end

  def show
    @recipe = Recipe.includes(:recipe_foods).find_by_id(params[:id])
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = @current_user
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe was successfully created.'
    else
      flash.now[:alert] = 'Recipe was not created, please fix the following errors:'
      render :new
    end
  end

  def update_public
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: !@recipe.public)
    redirect_to recipe_path(@recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
