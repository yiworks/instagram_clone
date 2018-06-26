Faker::Config.locale = :ja

User.create!(name: "John Doe",
            email: "johndoe@example.com",
            password: "foobar",
            password_confirmation: "foobar")

100.times do |n|
  name = Faker::Pokemon.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password)
end
