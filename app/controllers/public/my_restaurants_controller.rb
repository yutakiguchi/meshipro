class Public::MyRestaurantsController < ApplicationController
  def create
    @restaurant = Restaurnt.find(params[:restaurant_id])
    @favorite = MyRestaurant.create(user_id: current_user.id ,recipe_id: @restaurant.id)
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @favorite = MyRestaurant.find_by(user_id: current_user.id, recipe_id: @restaurant.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
