class MessagesController < ApplicationController
  before_action :set_group, only: [:index,:new,:create]

  def index
    @message = @group.messages.new
  end

  def new
    @message =Message.new
  end

  def create
    @message=Message.new(message_params)
      if @message.save
        redirect_to group_messages_path(@group), notice: '新しいメッセージが投稿されました'
        # @groupがgroup_idを持っているため引数は@group
    else
      flash.now[:alert] = '新しいメッセージを作成してください'
      render :index
     end
  end

private
  def set_message
    @message = Message.find(params[:id])
  end

  def set_group
    @group= Group.find(params[:group_id])
  end

  def message_params
    params.require(:message).permit(
      :body,
      :user_id,
      :group_id,
      :image,
    ).merge(user_id: current_user.id, group_id: params[:group_id])
    # スコープを超えたレコードの呼び出し方=merge
  end

end
