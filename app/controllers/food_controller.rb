class FoodsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @foods = Food.includes(recipe_foods: [:user]).where(foods: { user_id: @user.id })
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    new_food = current_user.foods.new(food_params)
    new_food.quantity = 0
    new_food.price = 0

    respond_to do |format|
      format.html do
        if new_food.save
          redirect_to "/users/#{new_food.user_id}/foods/", notice: 'Post was successfully created.'
        else
          render :new, status: 'Error occured will creating post!'
        end
      end
    end
  end

  def destroy
    Food.delete(params[:id])
  end

  private

  def food_params
    params.require(:food).permit(:name, :text)
  end
end
