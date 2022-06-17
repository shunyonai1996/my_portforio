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

10.times do |n|
  Occupation.create!(
    name: "職種#{n + 1}"
  )
end

users = User.order(:created_at).take(6)

def rand_str
  num = (0...60).to_a.sample
  num < 10 ? "0#{num}" : num.to_s
end
rand_time = "#{rand_str}:#{rand_str}"

50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  content_2 = Faker::Lorem.sentence(word_count: 5)
  content_3 = Faker::Lorem.sentence(word_count: 5)
  content_4 = Faker::Lorem.sentence(word_count: 5)
  content_5 = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(occupation_id: 1, job: 'トヨタ自動車' ,time: rand_time ,time_2: rand_time ,time_3: rand_time ,time_4: rand_time ,time_5: rand_time ,time_6: rand_time ,time_7: rand_time ,time_8: rand_time ,time_9: rand_time ,time_10: rand_time, content: content, content_2: content_2, content_3: content_3, content_4: content_4, content_5: content_5 ) }
end