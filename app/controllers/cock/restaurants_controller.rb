class Cock::RestaurantsController < ApplicationController
  def new
   @restaurant = Restaurant.new
  end

  def create
   @restaurant = Restaurant.new(restaurant_params)
   @restaurant.cock_id = current_cock.id
    if @restaurant.save!
     flash[:notice] = "店舗を登録しました"
     redirect_to cock_path(current_cock)
    else
      render action: :new
    end
  end

  def show
   @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = current_cock.restaurant.find(params[:id])
  end

  def destroy
    @restaurant = Recipe.find(params[:id])
    if @restaurant.destroy
     flash[:notice] = "登録店舗を削除しました"
     redirect_to cock_path(current_cock)
    else
     #render action: :edit
    end
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name,:postcode,:prefecture_code,:address_city,:address_street,:address_building,:description,:image).merge(cock_id:current_cock.id)
  end
end
