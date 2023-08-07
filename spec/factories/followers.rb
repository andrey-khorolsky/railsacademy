FactoryBot.define do
  factory :follower do
    author_id { (User.order("RANDOM()").limit(1))[0].id }
    follower_id { (User.order("RANDOM()").limit(1))[0].id }
  end
end
