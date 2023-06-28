class PublicRecipesController < ApplicationController
  include PublicRecipesHelper
  before_action :set_user
  def index
    @recipes = Recipe.includes(:recipe_foods, :user).where(public: true).order(created_at: :desc)
  end
end
