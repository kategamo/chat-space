class MessagesController < ApplicationController

  def new
    @message =Message.new
    @group= Group.find(params[:group_id])
  end

  def create
    @message =Message.new(message_params)
      if @message.save
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
    )
  end

end
