class Public::MyRestaurantsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
     my_restaurant = current_user.my_restaurants.new(restaurant_id: @restaurant.id)
     my_restaurant.save
    #redirect_back(fallback_location: root_path)
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    my_restaurant = current_user.my_restaurants.find_by(restaurant_id: @restaurant.id)
    my_restaurant.destroy
    #redirect_back(fallback_location: root_path)
  end
end
