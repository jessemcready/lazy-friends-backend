class GroupsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show, :create, :update]

  def index
    @groups = Group.all
    render json: { groups: @groups.as_json( include: { users: { except: :password} } ) }
  end

  def show
    @group = Group.find(params[:id])
    render json: @group, status: :ok
  end

  def create
    @group = Group.find_or_create_by(group_params)
    render json: @group, status: :created
  end

  def update
    @group = Group.find(params[:id])
    user = User.find(update_group_params[:user])
    @group.users << user
    @group.save
    render json: @group, include: :users, status: :ok
  end

  def my_groups
    @user = User.find(params[:id])
    render json: @user.groups, status: :ok
  end

  private
  def group_params
    params.require(:group).permit(:name, :user)
  end

  def update_group_params
    params.permit(:user)
  end

end
