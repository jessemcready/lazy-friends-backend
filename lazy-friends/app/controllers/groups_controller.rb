class GroupsController < ApplicationController
  skip_before_action :authorized, only: [:index, :show, :create, :update, :leave, :event_invite]

  def index
    @groups = Group.all
    render json: { groups: @groups.as_json( include: { users: { except: :password} } ) }
  end

  def show
    @group = Group.find(params[:id])
    render json: @group, status: :ok
  end

  def create
    @group = Group.create(name: group_params[:name], suggestions: group_params[:suggestions], description: group_params[:description])
    user = User.find(group_params[:user_id])
    @group.users << user
    if !group_params[:suggestions]
      @group.suggestions = 'bar'
    end
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

  def leave
    @group = Group.find(params[:id])
    user = User.find(update_group_params[:user])
    @group.users.delete(user)
    @group.save
    render json: @group, status: :ok
  end

  def event_invite
    @group = Group.find(params[:id])
    @group.users.each do |user|
      user_email = user.email
      message = params[:message]
      NotificationsMailer.event_invite(message, user_email).deliver_now
    end
  end

  ###############################################################################

  private
  def group_params
    params.require(:group).permit(:name, :user_id, :suggestions, :description)
  end

  def update_group_params
    params.permit(:user)
  end

end
