class GroupsController < ApplicationController
  def index
    @user = current_user
    @groups = @user.groups.includes(:operations).all
    @operations = @user.operations
  end

  def show
    @group = Group.find(params[:id])
    @operations = @group.operations.order(created_at: :desc)
  end

  def new
    @group = Group.new
  end

  def create
    @user = current_user
    @group = @user.groups.new(group_params)

    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit('name', 'icon')
  end
end
