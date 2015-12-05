include RandomData

#Create Users
5.times do
  user = User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end
users = User.all
#Create topics
15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end

topics = Topic.all

15.times do
  SponsoredPost.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    price: 50
  )
end

sponsored_posts = SponsoredPost.all

#Create Posts
50.times do
  Post.create!(
    user: users.sample,
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
  )
end
posts = Post.all

Post.find_or_create_by(title: "This is the real post") do |post|
  post.body = "This is the real body"
end

# Create Comments

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

Comment.find_or_create_by(body: "This is the real body")

user = User.first
user.update_attributes!(
  email: 'jacob.t.jackson@gmail.com',
  password: 'password'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
