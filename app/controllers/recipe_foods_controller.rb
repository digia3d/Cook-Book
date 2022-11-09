class RecipesFoodController < ApplicationController
  def new
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @food = @user.foods
    @recipe_foods = RecipeFoods.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = RecipeFoods.new(recipe_foods_params.merge(recipe_id: @recipe.id))
    if @recipe_foods.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = RecipeFoods.find(params[:id])
    @recipe_foods.destroy
    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe), notice: 'Food was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def recipe_foods_params
    params.require(:recipes_food).permit(:food_id)
  end

end
