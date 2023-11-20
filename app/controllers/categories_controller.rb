class CategoriesController < ApplicationController

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

end