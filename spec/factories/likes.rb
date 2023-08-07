FactoryBot.define do
  factory :like do
    post_id { rand((Post.order("RANDOM()").limit(1))[0].id) }
    user_id { rand((User.order("RANDOM()").limit(1))[0].id) }
  end
end
