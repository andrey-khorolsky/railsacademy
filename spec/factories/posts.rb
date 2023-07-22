FactoryBot.define do
  factory :post do
    user_id { rand(1..6) }
    text { Faker::Lorem.paragraph }
    img { open('/home/vboxuser/Downloads/' + ['gmc.jpg', 'exm1.jpeg', 'lemedoit.jpg', 'pepe.jpg'].sample) }
  end
end
