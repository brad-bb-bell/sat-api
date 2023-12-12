class CategoriesController < ApplicationController

  def index
    categories = Category.all
    render json: categories.as_json
  end

  def create
    category = Category.new(
      name: params["name"],
      user_id: params["user_id"],
    )
    if category.save
      render json: category.as_json
    else
      render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    category = Category.find_by(id: params["id"])
  
    if category
      # Remove associations
      CategoryActivity.where(category_id: category.id).delete_all
  
      # Destroy the category
      category.destroy
      render json: { message: "Category and its associations have been removed" }
    else
      render json: { error: "Category not found" }, status: :not_found
    end
  end
  

end