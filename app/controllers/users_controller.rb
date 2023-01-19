class UsersController < ApplicationController
  def create
    user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def index
    @users = User.all
    render template: "users/index"
  end

  def show
    @user = User.find_by(id: params["id"])
    render template: "users/show"
  end

  def update
    user = User.find_by(id: params["id"])
    user.name = params["name"] || user.name
    user.email = params["email"] || user.email
    user.streak = params["streak"] || user.streak
    if user.save
      render json: user.as_json
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by(params[:id])
    user.destroy
    render json: { message: "User has been deleted" }
  end
  
end
