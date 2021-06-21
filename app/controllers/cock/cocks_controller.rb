class Cock::CocksController < ApplicationController
  before_action :authenticate_cock!

  def show
    @cock = Cock.find(params[:id])
    @recipes = @cock.recipes
    @restaurants = @cock.restaurants
  end
end
