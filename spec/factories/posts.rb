FactoryBot.define do
  factory :post do
    user_id { rand(1..10) }
    text { Faker::Lorem.paragraph }
    img { nil }
  end
end
