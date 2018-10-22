class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users, except: :password, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

  def create
    @user = User.find_or_create_by(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: {status: "error", code: 3000, message: @user.errors}
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: @user, status: :ok
  end

  def login
    @user = User.find_by(username: user_params[:username])
    if @user
      if @user.password == user_params[:password]
        render json: @user, except: :password, status: :ok
      else
        render json: { status: 'error', code: '3100', message: 'Username or password invalid'}
      end
    else
      render json: { status: 'error', code: '3100', message: 'Username or password invalid'}
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :location, :coordinates, :username, :password)
  end

end
