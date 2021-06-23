FactoryBot.define do
  factory :restaurant do
    name             { Faker::Lorem.characters(number: 15) }
    description      { "カウンター5席、テーブル6席です。ご新規様大歓迎" }
    postcode         { "561" }
    prefecture_code  { "27" }
    address_city     { "豊中市" }
    address_street   { "服部豊町2-15-7"}
    address_building { "阪急オアシス" }
    cock             { create(:cock) }
  end
end