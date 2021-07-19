class Cock::RestaurantsController < ApplicationController
  before_action :authenticate_cock!
  before_action :correct_restaurant, only: [:show, :edit]

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    # TODO
    # addressカラムを追加して住所を結合する。
    # restaurantのmodelのgeocode_byをaddressに変更
    @restaurant.address = @restaurant.prefecture_name + @restaurant.address_city + @restaurant.address_street
    @restaurant.cock_id = current_cock.id
    if @restaurant.save
      flash[:notice] = "店舗を登録しました"
      redirect_to cock_path(current_cock)
    else
      render action: :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comments = @restaurant.restaurant_comments
    gon.restaurant = @restaurant
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      flash[:notice] = "店舗を登録しました"
      redirect_to restaurant_path(@restaurant)
    else
      render action: :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.destroy
      flash[:notice] = "登録店舗を削除しました"
      redirect_to cock_path(current_cock)
    else
      render action: :edit
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :postcode, :prefecture_code, :address_city, :address_street, :address_building, :description, :image, :address, :business_start, :business_finish).merge(cock_id: current_cock.id)
  end

  def correct_restaurant
    @restaurant = Restaurant.find(params[:id])
    unless @restaurant.cock.id == current_cock.id
      redirect_to root_path
    end
  end
end
