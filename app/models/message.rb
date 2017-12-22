class Message < ApplicationRecord

validates :message_cannot_be_empty, presence: true

belongs_to :user
belongs_to :group
mount_uploader :image, ImageUploader

  def message_cannot_be_empty
    body.presence || image.presence
  end
end
