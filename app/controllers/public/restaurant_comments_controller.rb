class Public::RestaurantCommentsController < ApplicationController
  def create
   @restaurant = Restaurnt.find(params[:restaurant_id])
   @restaurant_comment = @restaurant.restaurant_comments.build(restaurant_comment_params)
    if @restaurant_comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end 
  end
  
  private
   def restaurant_comment_params
     parmas.require(:restaurant_comment).permit(:text).merge(user_id:current_user.id)
   end 
   
end
