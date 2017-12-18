class Group < ApplicationRecord
validates :name, presence: true
has_many :members
has_many :users, through: :members
has_many :messages

  def add_error_sample
    # nameが空のときにエラーメッセージを追加する
    if name.empty?
      errors.add(:name, "に関係するエラーを追加")
      errors[:base] << "モデル全体に関係するエラーを追加"
    end
  end
end
