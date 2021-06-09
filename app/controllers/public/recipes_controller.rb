class Public::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @restaurants = Restaurant.all
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end  
end
