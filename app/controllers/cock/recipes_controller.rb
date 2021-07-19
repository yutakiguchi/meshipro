class Cock::RecipesController < ApplicationController
  before_action :authenticate_cock!
  before_action :correct_recipe, only: [:show, :edit]

  def new
    @recipe = Recipe.new
    @recipe.recipe_images.build
    @recipe.materials.build
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = current_cock.recipes.new(recipe_params)
    if @recipe.save
      flash[:notice] = "レシピを投稿しました"
      redirect_to recipe_path(@recipe)
    else
      render action: :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @average_rating = @recipe.recipe_comments.average(:rating)&.round(2)
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:notice] = "レシピを更新しました"
      redirect_to recipe_path(@recipe)
    else
      render action: :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      flash[:notice] = "レシピを削除しました"
      redirect_to cock_path(current_cock)
    else
      render action: :recipes_path
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :explanation, :material, :cook_text, materials_attributes: [:id, :name, :quantity, :_destroy], recipe_images_images: [])
  end

  def correct_recipe
    @recipe = Recipe.find(params[:id])
    unless @recipe.cock.id == current_cock.id
      redirect_to root_path
    end
  end
end
