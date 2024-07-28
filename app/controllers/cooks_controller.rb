class CooksController < ApplicationController
  before_action :set_cook, only: [:show, :update, :destroy]

  def index
    @cooks = Cook.where(is_deleted: false)
    render json: @cooks
  end

  def show
    if @cook.is_deleted
      render json: { message: "Cook not found" }, status: 404
    else
      render json: @cook
    end
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
    if @cook.update(cook_params) && !@cook.is_deleted
      render json: @cook
    else
      render json: { errors: @cook.errors.full_messages }, status: 422
    end
  end

  def destroy
    # @cook.destroy
    @cook.update(is_deleted: true, deleted_at: Time.now, password: params[:password])
    if @cook.save
      render json: { message: "Cook soft deleted" }
    else
      render json: { errors: @cook.errors.full_messages }, status: 422
    end
  end

  def login
    @cook = Cook.authenticate(params[:email], params[:password])
    if @cook
      render json: @cook
    else
      render json: { message: "Invalid email or password" }, status: 401
    end
  end

  private

  def cook_params
    params.require(:cook).permit(:name, :email, :password, :is_deleted)
  end

  def set_cook
    @cook = Cook.find(params[:id])
  end
end
