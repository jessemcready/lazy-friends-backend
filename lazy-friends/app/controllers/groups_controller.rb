class GroupsController < ApplicationController

  def index
    @groups = Group.all
    render json: @groups, include: :users, status: :ok
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
    @group.users << group_params[:user]
    @group.save
    render json: @group, status: :ok
  end

  def my_groups
    @user = User.find(params[:id])
    render json: @user.groups, status: :ok
  end

  private
  def group_params
    params.require(:group).permit(:name, :user)
  end

end
