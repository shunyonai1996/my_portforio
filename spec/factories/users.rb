FactoryBot.define do

  factory :user do
    sequence(:name)                   {|n| "TestUser#{n}"}
    sequence(:email)                  {|n| "Test@example.com"}
    sequence(:birthday)               {'1996-01-01'}
    # sequence(:occupation_id)          {'公務員'} DBに未定義のためエラーになる
    sequence(:work_span)              {'5'}
    sequence(:password)               {'foobar'}
    sequence(:password_confirmation)  {'foobar'}
    sequence(:admin)                  {true}
    
    trait :other do
      sequence(:name)                   {"TestUser2"}
      sequence(:email)                  {"Test2@example.com"}
      sequence(:birthday)               {'1996-01-01'}
      # sequence(:occupation_id)          {'公務員'} DBに未定義のためエラーになる
      sequence(:work_span)              {'5'}
      sequence(:password)               {'foobar'}
      sequence(:password_confirmation)  {'foobar'}
      sequence(:admin)                  {false}
    end
  end
end