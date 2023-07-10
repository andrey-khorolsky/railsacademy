FactoryBot.define do
  factory :comment do
    user_id {rand(1..6)}
    post_id {rand(1..8)}
    text {Faker::Lorem.sentence}
  end
end
