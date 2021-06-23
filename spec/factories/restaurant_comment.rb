FactoryBot.define do
  factory :restaurant_comment do
    text    { Faker::Lorem.characters(number: 30) }
    user    { create(:user) }
    association :restaurant
  end
end