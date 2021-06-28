class Public::RestaurantCommentsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant_comment = @restaurant.restaurant_comments.build(restaurant_comment_params)
    if @restaurant_comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    @restaurant_comment = RestaurantComment.find(params[:id])
    if @restaurant_comment.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  
  def restaurant_comment_params
    params.require(:restaurant_comment).permit(:text, :rating).merge(user_id: current_user.id)
  end
end
