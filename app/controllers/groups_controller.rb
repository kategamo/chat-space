class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to :root, notice: 'New group was successfully created'
    else
      redirect_to ({ action: :new }), alert: 'New group was unsuccessfully created'
     end
  end

  def edit
    @group = Group.find(group_params[:group_id])
  end

  def update
    if group.user_id = current_user_id
    @group.update(group_params)
    redirect_to :root
    end
  end


    private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(
      :name,
      :id,
    )
  end
end
