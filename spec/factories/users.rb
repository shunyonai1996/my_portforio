FactoryBot.define do

  factory :user do
    name            {'Example User'}
    email           {'user@example.com'}
    password        {'foobar'}
    birthday        {'1996-10-10'}
    # job             {'公務員'}
    # work_span       {5}
  end
end