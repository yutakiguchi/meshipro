class Public::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @restaurants = Restaurant.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_comment = RecipeComment.new
    @recipe_comments = @recipe.recipe_comments
  end
end
