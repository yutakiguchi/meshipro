class Public::RecipeCommentsController < ApplicationController
  def create
   @recipe_comment = RecipeComment.new(recipe_comment_params)
   @recipe_comment.user_id = current_user.id
    if @recipe_comment.save
     redirect_back(fallback_location: root_path)
    else
     redirect_back(fallback_location: root_path)
    end
  end
  
private
 def recipe_comment_params
   params.require(:recipe_comment).permit(:text)
    
end
