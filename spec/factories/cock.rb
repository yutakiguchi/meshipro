FactoryBot.define do
  factory :cock do
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
