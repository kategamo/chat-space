FactoryGirl.define do
  factory :message do
    body Faker::Lorem.sentence
    image File.open("#{Rails.root}/public/images/download.jpg")
    user
    group
  end
end
