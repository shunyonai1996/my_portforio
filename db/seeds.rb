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
32.times do |n|
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

occupations = [ {name: '食品・農林・水産'}, {name: '建設・住宅・インテリア'}, {name: '繊維・化学・薬品・化粧品'}, {name: '鉄鋼・金属・鉱業'}, {name: '機械・プラント'}, {name: '電子・電気機器'}, {name: '自動車・転送用機器'}, {name: '精密・医療用機器'}, {name: '印刷・事務機器関連'}, {name: 'スポーツ・玩具'}, {name: 'その他メーカー'}, {name: '総合商社'}, {name: '専門商社'}, {name: '百貨店・スーパー'}]

Occupation.create!(occupations)

users = User.order(:created_at).take(6)

32.times do
  content = Faker::Lorem.sentence(word_count: 5)
  

  users.each { |user| user.microposts.create!(occupation_id: 1, job: 'トヨタ自動車' ,busyness: '繁忙期', seniority_year: '１年未満', likes_count: 0, job_discriptions_attributes:[content: content, time: '08:30'] ) }
end