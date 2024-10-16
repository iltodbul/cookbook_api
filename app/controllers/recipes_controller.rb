class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  # GET /recipes
  def index
    @recipes = Recipe.where(is_deleted: false).limit(10)
    render json: @recipes
  end

  # GET /recipes/:id
  def show
    if @recipe.is_deleted
      #   head :no_content
      render json: { message: "Recipe not found" }, status: 404
    else
      render json: @recipe
    end
  end

  def full_recipe_info
    set_recipe

    if @recipe.is_deleted
      render json: { message: "Recipe not found" }, status: 404
    else
      render json: @recipe, serializer: RecipeSerializer
    end
  end

  def full_info
    service = FetchRecipeDetailsService.new(params[:id])
    recipe_details = service.call

    if recipe_details.nil?
      render json: { message: "Recipe not found" }, status: 404
    else
      render json: recipe_details, status: 200
    end
  end

  def search_by_name
    @recipes = Recipe.where("name ILIKE ?", "%#{params[:query]}%").limit(10)
    render json: @recipes
  end

  def search_by_ingredient
    @recipes = Recipe.joins(:ingredients).where("ingredients.name ILIKE ?", "%#{params[:query]}%").limit(10)
    render json: @recipes
  end

  def search_by_category
    @recipes = Recipe.joins(:category).where("categories.name ILIKE ?", "%#{params[:query]}%").limit(10)
    render json: @recipes
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      render json: @recipe, status: :created
    else
      render json: { errors: @recipe.errors.full_messages }, status: 422
    end
  end

  # PUT/PATCH /recipes/:id
  def update
    if @recipe.update(recipe_params) && !@recipe.is_deleted
      render json: @recipe
    else
      render json: { errors: @recipe.errors.full_messages }, status: 422
    end
  end

  # DELETE /recipes/:id
  def destroy
    @recipe.update(is_deleted: true, deleted_at: Time.current)
    if @recipe.save
      render json: { message: "Recipe soft deleted" }
    else
      render json: { errors: @recipe.errors.full_messages }, status: 422
    end
  end

  private

  # Set the recipe based on the id parameter
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Strong parameters
  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :preparation_time, :cooking_time, :portions_count, :category_id, :original_url, :cook_id)
  end
end
