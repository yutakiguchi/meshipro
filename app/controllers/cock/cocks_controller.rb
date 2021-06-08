class Cock::CocksController < ApplicationController
def show
  @cock=Cock.find(params[:id])
  @recipes=@cock.recipes
  @restaurants=@cock.restaurant
end




end
