# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 10.times do
#     user = FactoryBot.build(:user)
#     rand(1..5).times do
#         Like.like rand(1..10), user.id
#     end
#     rand(1..5).times do
#         Comment.new(post_id: rand(1..10), user_id: user.id, text: Faker::Lorem.sentence)
#     end
#     user.save
# end

# 16.times do |id|
#     Follower.follow rand(1..16),rand(1..16)
# end

# 16.times do
# Like.like rand(1..26), rand(5..16)
# Comment.new(post_id: rand(1..26), user_id: rand(5..16), text: Faker::Lorem.sentence).save
# end

NoticeType.create([
                    {
                      typename: 'subscribe'
                    },
                    {
                      typename: 'like'
                    },
                    {
                      typename: 'comment'
                    }
                  ])
