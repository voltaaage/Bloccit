require 'faker'

# Create Posts
3.times do 
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end
posts = Post.all

# Create Comments
3.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  ) 
end

if Post.where(:title => "**This is my unique title**").length == 0 
  Post.create!(
      title: "**This is my unique title**",
      body: "**This is my unique body**"
    )
end

if Comment.where(:body => "**My unique comment on this post!**").length ==0
  Comment.create!(
      post: posts.sample,
      body: "**My unique comment on this post!**"
    )
end


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

Post.all.each do |p|
  puts "Title: #{p.title}"
  Comment.all.each do |c|
    puts "   Comments: #{c.body}"
  end
end