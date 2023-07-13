FactoryBot.define do
  factory :like do
    post_id { rand(1..10) }
    user_id { rand(1..10) }
  end
end
