class Public::RecipeCommentsController < ApplicationController
  def create
   @recipe = Recipe.find(params[:recipe_id])
   @recipe_comment = @recipe.recipe_comments.build(recipe_comment_params)
   @recipe_comment.user_id = current_user.id
   #pry.byebug
   if @recipe_comment.save
    redirect_back(fallback_location: root_path)
   end
  end
  
  def destroy
   @recipe_comment = RecipeComment.find(params[:id])
   if @recipe_comment.destroy
    redirect_back(fallback_location: root_path)
   end
  end

private
 def recipe_comment_params
   params.require(:recipe_comment).permit(:text,:rating).merge(user_id:current_user.id)
 end

end
