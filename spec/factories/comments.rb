FactoryBot.define do
  factory :comment do
    user_id { rand(1..10) }
    post_id { rand(1..10) }
    text { Faker::Lorem.sentence }
  end
end
