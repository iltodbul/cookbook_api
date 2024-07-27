class CooksController < ApplicationController
  def index
    @cooks = Cook.all
    render json: @cooks
  end

  def show
    @cook = Cook.find(params[:id])
    render json: @cook
  end

  def create
    @cook = Cook.create(cook_params)
    if @cook.save
      render json: @cook
    else
      render json: { errors: @cook.errors.full_messages }, status: 422
    end
  end

  def update
    @cook = Cook.find(params[:id])
    if @cook.update(cook_params)
      render json: @cook
    else
      render json: { errors: @cook.errors.full_messages }, status: 422
    end
  end

  def destroy
    @cook = Cook.find(params[:id])
    @cook.destroy
    render json: { message: 'Cook deleted' }
  end

  private

  def cook_params
    params.require(:cook).permit(:name, :email, :password, :is_deleted)
  end
end
