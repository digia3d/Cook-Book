class RecipeFoodsController < ApplicationController
  def new
    recipe = Recipe.find(params[:recipe_id])
    unless recipe.user == current_user
      flash[:alert] =
        'You do not have access to add an ingredient on a recipe that belongs to other Users'
      return redirect_to recipes_path
    end
    @recipe_food = RecipeFood.new
    @foods = current_user.foods
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    recipe_foods = RecipeFood.new(recipe_foods_params)
    recipe_foods.recipe = @recipe
    if recipe_foods.save
      redirect_to recipe_path(@recipe), notice: 'New ingredient was added Succes'
    else
      flash[:alert] = 'Failed, Please try again!!'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = RecipeFood.find(params[:id])
    @recipe_foods.destroy
    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe), notice: 'Food was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def recipe_foods_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
