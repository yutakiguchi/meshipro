class Cock::CocksController < ApplicationController
def show
  @cock = Cock.find(params[:id])
  @recipes = @cock.recipes
  @restaurants = @cock.restaurants
  @recipe = Recipe.find(params[:id])
  @average_rating = @recipe.recipe_comments.average(:rating).round(2)
end




end
