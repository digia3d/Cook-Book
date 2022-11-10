class PublicRecipesController < ApplicationController
  skip_before_action :authenticate_user!  
  def index
    @public_recipes = Recipe.new
    @public_recipes = Recipe.where(public: true).order('created_at DESC')
  end
end
