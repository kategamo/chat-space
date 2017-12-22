class GroupsController < ApplicationController
  before_action :group_find, only:[:edit,:update]

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group) , notice: '新しいグループが作成されました'
    else
      render :new , alert: '新しいグループを作成してください'
     end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    if @group.update(group_params)
    redirect_to group_messages_path(@group.id)
    else
    render :edit , alert: 'グループを編集してください'
    end
  end

private

  def group_find
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(
      :name,
      {:user_ids => []}
    )
  end
end
