class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    new_food = current_user.foods.new(food_params)
   
    respond_to do |format|
      format.html do
        if new_food.save
          redirect_to '/foods/', notice: 'Post was successfully created.'
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
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
