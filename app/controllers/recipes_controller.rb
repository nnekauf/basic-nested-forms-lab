class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    2.times { @recipe.ingredients.build }#(name_type: 'name')
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    end
  end

  private

  def recipe_params

    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [ :name, :quantity ]
    )
   

  end
end
