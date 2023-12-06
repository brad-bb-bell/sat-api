class ActivitiesController < ApplicationController

  def index
    @activities = Activity.includes(:categories).all
    render template: "activities/index"
  end

  def show
    @activity = Activity.find_by(id: params["id"])
    render template: "activities/show"
  end

  def create
    activity = Activity.new(
      name: params["name"],
      user_id: params["user_id"],
    )
    if activity.save
      render json: activity.as_json
    else
      render json: { errors: activity.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    activity = Activity.find_by(id: params["id"])
    activity.name = params["name"] || activity.name
    activity.user_id = params["user_id"] || activity.user_id

    # Update categories if provided
    if params[:category_ids]
      # Replace the current categories with the new set
      activity.category_ids = params[:category_ids]
    end

    if activity.save
      render json: activity.as_json
    else
      render json: { errors: activity.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    activity = Activity.find_by(id: params["id"])
    activity.destroy
    render json: { message: "Activity has been removed" }
  end

end
