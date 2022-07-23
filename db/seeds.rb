require 'csv'

# CSV読み込み
file_path = 'db/industry_data.csv'
csv_data = CSV.read(file_path)

# 大項目データ抽出
industries_list = csv_data.map { |row| row[2] }.uniq

# 小項目データ抽出
occupations_list = csv_data.map do |row|
    next if row[2] == nil
    row[2, 3]
  end.compact

# 大項目データ作成
industries_list.each do |industry|
  Industry.create!(name: industry)
end

# 小項目データ作成
occupations_list.each do |industry, occupation|
  industry = Industry.find_by(name: industry)
  industry.occupations.create(name: occupation)
end

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

users = User.order(:created_at).take(6)

32.times do
  content = Faker::Lorem.sentence(word_count: 5)
  

  users.each { |user| user.microposts.create!(occupation_id: 1, industry_id: 1, job: 'トヨタ自動車' ,busyness: '繁忙期', seniority_year: '１年未満', likes_count: 0, job_discriptions_attributes:[content: content, time: '08:30'] ) }
end