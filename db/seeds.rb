Faker::Config.locale = :ja

# Users
User.create!(name: "John Doe",
            email: "johndoe@example.com",
            password: "foobar",
            password_confirmation: "foobar",
            admin: true)

100.times do |n|
  name = Faker::Pokemon.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password)
end

# Posts
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(content: content) }
end


# Relationships
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
