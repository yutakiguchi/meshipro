class Cock::RecipesController < ApplicationController
  def index
    @recipes=Recipe.all
  end

  def show
  end

  def edit
  end

  def new
    @recipe=Recipe.new
  end

  def create
    @recipe=Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice]="料理を投稿しました!"
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private

   def recipe_params
     params.require(:recipe).permit(:name,:explanation,:material,:cock_text,:cock_id,recipe_images_images:[])
   end

end
