FactoryBot.define do
  factory :post do
    user_id { rand(1..6) }
    text { Faker::Lorem.paragraph }
    img { [nil, 'gmc.jpg', 'exm1.jpeg', 'lemedoit.jpg'][rand(0..3)] }
  end
end
