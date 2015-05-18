require 'faker'

# Create Users
5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all


# Create Posts
50.times do 
  Post.create!(
    user: users.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    # users.sample,   #we have not yet associated Users with Comments
    post: posts.sample,
    body: Faker::Lorem.paragraph
  ) 
end


# Creating my own user with the seed
user = User.first
user.skip_reconfirmation!
user.update_attributes!(
  name: 'Fong Fan',
  email: 'fong.fan.90@gmail.com',
  password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

# Post.all.each do |p|
#   puts "Title: #{p.title}"
#   p.comments.all.each do |c|
#     puts "   Comments: #{c.body}"
#   end
# end