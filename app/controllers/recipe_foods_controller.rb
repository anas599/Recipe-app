class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[show edit update destroy]

  def index
    @recipe_foods = RecipeFood.all
  end

  def show; end

  def new
    @recipe_food = RecipeFood.new
    @recipe_id = params[:recipe_id]
  end

  def edit; end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = params[:recipe_food][:recipe_id]
    respond_to do |format|
      if @recipe_food.save
        format.html do
          redirect_to recipe_url(@recipe_food.recipe_id), notice: 'Recipe food was successfully created.'
        end
        format.json { render :show, status: :created, location: @recipe_food }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe_food.update(recipe_food_params)
        format.html do
          redirect_to recipe_url(@recipe_food.recipe_id), notice: 'Recipe food was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @recipe_food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_food.destroy

    respond_to do |format|
      format.html { redirect_to recipe_foods_url, notice: 'Recipe food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end
end
