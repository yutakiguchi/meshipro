class Public::RestaurantsController < ApplicationController
  def index
   @restaurants = Restaurant.all
  end

  def show
   @restaurant = Restaurant.find(params[:id])
   @restaurant_comment = RestaurantComment.new
   @restaurant_comments = @restaurant.restaurant_comments
  end
end
