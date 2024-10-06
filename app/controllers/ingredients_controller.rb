class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :update, :destroy]

  def index
    @ingredients = Ingredient.where(is_deleted: false).limit(10)
    render json: @ingredients
  end

  def show
    render json: @ingredient
  end

  def create
    @ingredient = Ingredient.create(ingredient_params)
    if @ingredient.save
      render json: @ingredient
    else
      render json: { errors: @ingredient.errors.full_messages }, status: 422
    end
  end

  def update
    if @ingredient.update(ingredient_params)
      render json: @ingredient
    else
      render json: { errors: @ingredient.errors.full_messages }, status: 422
    end
  end

  def destroy
    @ingredient.destroy
    render json: { message: "Ingredient deleted" }
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :is_deleted)
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
