class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to new_group_message_path(@group) , notice: '新しいグループが作成されました'
    else
      render :new , alert: '新しいグループを作成してください'
     end
  end

  def edit
    set_group
  end

  def update
    set_group
    if @group.update(group_params)
    redirect_to new_group_message_path(@group.id)
    else
    render :edit , alert: 'グループを編集してください'
    end
  end

private
  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(
      :name,
      {:user_ids => []}
    )
  end
end
