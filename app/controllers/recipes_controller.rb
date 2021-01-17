class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(ingredients_attributes)
    @recipe.ingredients.build(ingredients_attributes)
  end

  def create
    recipe = Recipe.create(recipe_params)
    redirect_to recipes_path
  end

  private
 
  def recipe_params
    params.require(:person).permit(:name, ingredients_attributes: [:name, :quantity])
  end
end
