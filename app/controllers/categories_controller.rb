class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json: @categories
  end

  def show
    @category = Category.find(params[:id])
    render json: @category
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      render json: @category
    else
      render json: { errors: @category.errors.full_messages }, status: 422
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      render json: @category
    else
      render json: { errors: @category.errors.full_messages }, status: 422
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    render json: { message: 'Category deleted' }
  end

  private

  def category_params
    params.require(:category).permit(:name, :is_deleted)
  end
end
