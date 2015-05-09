require 'faker'

# Create Posts
50.times do 
  uniqueTitle=Faker::Lorem.sentence
  uniqueBody=Faker::Lorem.paragraph
  if (Post.where(:title => uniqueTitle).length == 0) #&&(Post.where(:body => uniqueTitle).length == 0)
    Post.create!(
        title: uniqueTitle,
        body: uniqueBody
      )
  end
end
posts = Post.all

# Create Comments
100.times do
  uniquePost = posts.sample
  uniqueBody = Faker::Lorem.paragraph
  if (Comment.where(:post => uniquePost).length ==0) #&& (Comment.where(:body => uniquePost).length ==0)
    Comment.create!(
        post: uniquePost,
        body: uniqueBody
      )
  end
end

# if Post.where(:title => "This is my unique title").length == 0 
#   Post.create!(
#       title: "This is my unique title",
#       body: "This is my unique body"
#     )
# end

# if Comment.where(:post => "This is my unique comment").length ==0
#   Comment.create!(
#       post: "This is my unique comment",
#       body: "My one and only comment"
#     )
# end


puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"