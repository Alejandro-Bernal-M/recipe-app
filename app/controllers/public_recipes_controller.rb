class PublicRecipesController < ApplicationController
  before_action :set_user
  include PublicRecipeshelper
  def index
    @recipes = Recipe.includes(:recipe_foods, :user).where(public: true)
  end
end
