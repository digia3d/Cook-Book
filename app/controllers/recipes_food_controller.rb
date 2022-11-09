class RecipesFoodController < ApplicationController
  def new
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @food = @user.foods
    @recipes_food = RecipesFood.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipes_food = RecipesFood.new(recipes_food_params.merge(recipe_id: @recipe.id))
    if @recipes_food.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipes_food = RecipesFood.find(params[:id])
    @recipes_food.destroy
    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe), notice: 'Food was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def recipes_food_params
    params.require(:recipes_food).permit(:food_id)
  end

end
