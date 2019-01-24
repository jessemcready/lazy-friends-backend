class UsersController < ApplicationController
  skip_before_action :authorized, only: [:index, :show, :create, :profile, :update, :mailer]

  def index
    @users = User.all
    render json: @users, except: :password, status: :ok
  end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

  def create
   @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      # render json: { user: @user.as_json(include: { groups: { include: { users: { except: :password } } } } ) }
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
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

  def mailer
    @user = User.find(params[:id])
    message = params[:message]
    NotificationsMailer.group_invite(message).deliver_now
  end

  #####################################################################################

  private

  def user_params
    params.require(:user).permit(:name, :email, :location, :coordinates, :username, :password, :profile_url)
  end

end
