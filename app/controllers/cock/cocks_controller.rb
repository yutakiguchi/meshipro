class Cock::CocksController < ApplicationController
def show
  @cock = Cock.find(params[:id])
  @recipes = @cock.recipes
  @restaurants = @cock.restaurants
end




end
