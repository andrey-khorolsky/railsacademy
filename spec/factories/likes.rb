FactoryBot.define do
  factory :like do
    post_id { rand(10..15) }
    user_id { rand(10..15) }
  end
end
