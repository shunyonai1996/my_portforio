FactoryBot.define do
  factory :micropost do
    occupation { "MyString" }
    job { "MyString" }
    time { "2022-06-07 21:06:28" }
    content { "hello" }
    # user { nil }
    association :user

    trait :most_recent do
      created_at { Time.zone.now }
    end

    trait :some_time_ago do
      created_at { 30.minutes.ago }
    end

    trait :yesterday do
      created_at { 1.day.ago }
    end

    trait :last_week do
      created_at { 1.month.ago }
    end
  end
end
