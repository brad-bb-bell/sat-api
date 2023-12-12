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
      CategoryActivity.where(category_id: category.id).delete_all
  
      begin
        category.destroy
        render json: { message: "Category and its associations have been removed" }
      rescue => e
        Rails.logger.error e.message
        e.backtrace.each { |line| Rails.logger.error line }
        render json: { error: e.message }, status: :internal_server_error
      end
    else
      render json: { error: "Category not found" }, status: :not_found
    end
  end
  
  

end