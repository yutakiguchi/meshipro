class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    my_recipes = MyRecipe.where(user_id: current_user.id).pluck(:recipe_id)
    @my_recipe_list = Recipe.find(my_recipes)
  end

end
