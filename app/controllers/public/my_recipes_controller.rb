class Public::MyRecipesController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = MyRecipe.create(user_id: current_user.id ,recipe_id: @recipe.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = MyRecipe.find_by(user_id: current_user.id, recipe_id: @recipe.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
