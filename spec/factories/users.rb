FactoryBot.define do

  factory :user do
    sequence(:name)                   {|n| 'TestUser#{n}'}
    sequence(:email)                  {'Test@example.com'}
    sequence(:birthday)               {'1996-01-01'}
    sequence(:password)               {'foobar'}
    sequence(:password_confirmation)  {'foobar'}
    # job             {'公務員'}
    # work_span       {5}
  end
end