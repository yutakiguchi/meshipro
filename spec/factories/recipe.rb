FactoryBot.define do
  factory :recipe do
    name        {Faker::Food}
    explanation {"とっても柔らかい"}
    cook_text   {"①細かく刻んで炒める"}
    cock        { create(:cock) }
  end
end