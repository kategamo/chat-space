class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  has_many :messages
  has_many :members
  has_many :groups, through: :members

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
