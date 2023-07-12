FactoryBot.define do
  factory :follower do
    author_id { 1 }
    follower_id { rand(2..4) }
  end
end
