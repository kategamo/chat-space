require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
  context "available to save messages"

      it "is valid with a image" do
        expect(build(:message, image:nil)).to be_valid
      end

      it "is valid with a body and image" do
        expect(build(:message, body:nil)).to be_valid
      end

      context "not available to save messages"

      it "is invalid without a body and image " do
        message = build(:message, body: nil, image: nil)
        message.valid?
        expect(message.errors[:body]).to include("を入力してください")
      end

      it "is invalid without a group_id" do
        message = build(:message,group_id: nil)
        message.invalid?
        expect(message.errors[:group]).to include("を入力してください")
      end

      it "is invalid without a user_id" do
        message = build(:message, user_id:nil)
        message.invalid?
        expect(message.errors[:user]).to include("を入力してください")
      end
  end
end
