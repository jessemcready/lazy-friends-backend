class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

  def create
    @user = User.find_or_create_by(user_params)
    render json: @user, status: :created
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: @user, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :location, :coordinates)
  end

end
