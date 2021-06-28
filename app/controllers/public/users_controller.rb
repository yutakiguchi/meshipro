class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    my_recipes = MyRecipe.where(user_id: current_user.id).pluck(:recipe_id)
    @my_recipe_list = Recipe.find(my_recipes)
    @ranks = Recipe.find(MyRecipe.group(:recipe_id).order('count(recipe_id)desc').limit(3).pluck(:recipe_id))
  end

  def my_recipes
    @user = User.find(params[:id])
    my_recipes = MyRecipe.where(user_id: current_user.id).pluck(:recipe_id)
    @my_recipe_lists = Recipe.find(my_recipes)
  end

  def my_restaurants
    @user = User.find(params[:id])
    my_restaurants = MyRestaurant.where(user_id: current_user.id).pluck(:restaurant_id)
    @my_restaurant_lists = Restaurant.find(my_restaurants)
  end
end
