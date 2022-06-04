# メインのサンプルユーザーを1人作成する
User.create!(name:  "TestUser",
  email: "sample@example.com",
  birthday: "1996-10-28",
  password:              "foobar",
  password_confirmation: "foobar",
  admin: true)

# 追加のユーザーをまとめて生成する
99.times do |n|
name  = Faker::Name.name
email = "sample-#{n+1}@example.com"
birthday = "1996-10-28"
password = "foobar"
User.create!(name:  name,
    email: email,
    birthday: birthday,
    password:              password,
    password_confirmation: password)
end