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

# Create an admin user
admin = User.new(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
)
admin.skip_confirmation!
admin.save!

# Create a moderator
moderator = User.new(
  name: 'Moderator User',
  email: 'moderator@example.com',
  password: 'hellowworld',
  role: 'moderator'
)
moderator.skip_confirmation!
moderator.save!

# Create a member
member = User.new(
  name: 'Member User',
  email: 'member@example.com',
  password: 'helloworld'
)
member.skip_confirmation!
member.save!

users = User.all

# Create Topics
 5.times do
   Topic.create!(
     name:         Faker::Lorem.sentence,
     description:  Faker::Lorem.paragraph
   )
 end
 topics = Topic.all

# Create Posts
20.times do 
  Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end
posts = Post.all

# Create Comments
20.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph,
    user: users.sample,
  ) 
end


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