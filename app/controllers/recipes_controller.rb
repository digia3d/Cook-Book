class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = RecipeFood.where(recipe_id: @recipe.id)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    new_recipe = current_user.recipes.new(recipe_params)

    respond_to do |format|
      format.html do
        if new_recipe.save
          redirect_to '/recipes/', notice: 'Recipe was successfully created.'
        else
          render :new, status: 'Error occured will creating recipe!'
        end
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect_to '/recipes/', notice: 'Recipe was successfully deleted.'
  end

  def public
    @recipes = Recipe.where(public: true)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :ingredients, :public)
  end
end
