class GroupsController < ApplicationController

  before_action :login_required, :only => [:new, :create, :edit,:update,:destroy]

  def group_params
    params.require(:group).permit(:title,:descroptioin)
  end

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @posts = @group.posts
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
    @group = current_user.groups.find(params[:id])
  end

  def update
    @group = current_user.groups.find(params[:id])

    if @group.update(group_params)
      redirect_to groups_path(@group)
    else
      render :edit
    end
  end

  def destroy
    @group = current_user.groups.find(params[:id])

    @group.destroy

    redirect_to groups_path
  end
end
