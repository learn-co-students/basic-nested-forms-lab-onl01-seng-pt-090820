class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: "Ingredient_1")
    @recipe.ingredients.build(name: "Ingredient_2")
  end

  def create
    @recipe = Recipe.new(recipe_params)
    #binding.pry
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

  private
    def recipe_params
      params.require(:recipe).permit(:title, ingredients_attributes: [:name, :quantity])
    end

end
