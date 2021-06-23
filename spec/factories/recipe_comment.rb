FactoryBot.define do
  factory :recipe_comment do
    text    { Faker::Lorem.characters(number: 30) }
    user { create(:user) }
    association :recipe
  end
end