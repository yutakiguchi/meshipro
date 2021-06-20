class Public::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @restaurants = Restaurant.all
    @ranks = Recipe.find(MyRecipe.group(:recipe_id).order('count(recipe_id)desc').limit(3).pluck(:recipe_id))
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_comment = RecipeComment.new
    @recipe_comments = @recipe.recipe_comments
    @restaurants = @recipe.cock.restaurants
    
    if @recipe.recipe_comments.blank?
      @average_rating = 0
    else
      @average_rating = @recipe.recipe_comments.average(:rating)&.round(2)
    end
  end
end
