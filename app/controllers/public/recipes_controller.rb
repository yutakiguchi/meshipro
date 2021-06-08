class Public::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @restaurants = Restaurant.all
  end
end
