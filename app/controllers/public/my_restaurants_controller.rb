class Public::MyRestaurantsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
     my_restaurant = current_user.my_restaurants.new(restaurant_id: @restaurant.id)
     my_restaurant.save
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    my_restaurant = current_user.my_restaurants.find_by(restaurant_id: @restaurant.id)
    my_restaurant.destroy
  end
end
