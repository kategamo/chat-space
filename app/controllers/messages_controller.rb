class MessagesController < ApplicationController
  def index
  new

  end
  def new
    @message =Message.new
    @group= Group.find(params[:group_id])
  end

  def create
    @message=Message.new(message_params)
    @group= Group.find(params[:group_id])
      if @message.save
        redirect_to group_messages_path(@group),notice: '新しいメッセージが投稿されました'
        # @groupがgroup_idを持っているため引数は@group
    else
      render :new , alert: '新しいメッセージを作成してください'
     end
  end

private
  def set_message
    @message = Message.find(params[:id])
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
