class RecipesController < ApplicationController
  before_action :set_user
  include RecipesHelper

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end
end
