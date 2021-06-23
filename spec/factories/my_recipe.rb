FactoryBot.define do
  factory :my_recipe do
    association :recipe
    association :user
  end
end