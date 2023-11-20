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
    category.destroy
    render json: { message: "Category has been removed" }
  end

end