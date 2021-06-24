class Cock::CocksController < ApplicationController
  before_action :authenticate_cock!
  before_action :correct_cock,only: [:show]

  def show
    @cock = Cock.find(params[:id])
    @recipes = @cock.recipes
    @restaurants = @cock.restaurants
  end
  
  def correct_cock
        @cock = Cock.find(params[:id])
    unless @cock.id == current_cock.id
      redirect_to root_path
    end
  end
end
