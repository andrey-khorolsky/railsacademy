FactoryBot.define do
  factory :post do
    user_id { rand(User.select(:id).limit(20).id) }
    text { Faker::Lorem.paragraph }
    img { open('/home/vboxuser/Downloads/' + ['gmc.jpg', 'exm1.jpeg', 'lemedoit.jpg', 'pepe.jpg'].sample) }
  end
end
