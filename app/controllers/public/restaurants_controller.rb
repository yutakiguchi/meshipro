class Public::RestaurantsController < ApplicationController
 def index
  @restaurants = Restaurant.all
  
 end

 def show
  @restaurant = Restaurant.find(params[:id])
  @restaurant_comment = RestaurantComment.new
  @restaurant_comments = @restaurant.restaurant_comments
  @recipes = @restaurant.cock.recipes
  gon.restaurant = @restaurant

  if @restaurant.restaurant_comments.blank?
    @average_rating = 0
  else
    @average_rating = @restaurant.restaurant_comments.average(:rating).round(2)
  end
 end
end
