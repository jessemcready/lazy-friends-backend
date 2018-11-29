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
    @user = User.create(user_params)
    byebug
    if @user.save
      render json: { user: UserSerializer.new(@user) }, status: :created
      # render json: { user: @user.as_json(include: { groups: { include: { users: { except: :password } } } } ) }
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
      # render json: {status: "error", code: 3000, message: @user.errors}
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
        render json: { user: @user.as_json(include: { groups: { include: { users: { except: :password } } } } ) }
      else
        render json: { status: 'error', code: '3100', message: 'Username or password invalid'}
      end
    else
      render json: { status: 'error', code: '3100', message: 'Username or password invalid'}
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :location, :coordinates, :username, :password, :profile_url)
  end

end
