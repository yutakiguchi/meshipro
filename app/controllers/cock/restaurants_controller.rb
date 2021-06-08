class Cock::RestaurantsController < ApplicationController
  def new
   @restaurant = Restaurant.new
  end

  def create
   @restaurant = Restaurant.new(restaurant_params)
   @restaurant.cock_id = current_cock.id
    if @restaurant.save
     flash[:notice] = "店舗を登録しました"
     redirect_to cock_path(current_cock)
    #else
      #render action: :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name,:post_code,:prefecture_code,:address_city,:address_street,:address_building,:description,:image)
  end
end
