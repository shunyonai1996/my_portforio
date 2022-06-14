# メインのサンプルユーザーを1人作成する
User.create!(name:  "TestUser",
            email: "sample@example.com",
            birthday: "1996-10-28",
            password:              "foobar",
            password_confirmation: "foobar",
            admin: true,
            activated: true,
            activated_at: Time.zone.now)

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
            password_confirmation: password,
            activated: true,
            activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)

def rand_str
  num = (0...60).to_a.sample
  num < 10 ? "0#{num}" : num.to_s
end
rand_time = "#{rand_str}:#{rand_str}"

50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(occupation: '営業職', job: 'トヨタ自動車' ,time: rand_time, content: content ) }
end