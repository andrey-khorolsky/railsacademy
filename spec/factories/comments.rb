FactoryBot.define do
  factory :comment do
    user_id { FactoryBot.create(:user).id }
    post_id { (User.order("RANDOM()").limit(1))[0].id }
    text { Faker::Lorem.sentence }
  end
end
