module GroupHelper

  def group_status(group)
   if group.messages.last.try(:body).presence
        group.messages.last.try(:body)
      elsif group.messages.last.try(:image).presence
        "画像が投稿されています"
      else
        "まだメッセージはありません。"
      end
  end

end
