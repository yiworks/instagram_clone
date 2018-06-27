Faker::Config.locale = :ja

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

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(content: content) }
end
