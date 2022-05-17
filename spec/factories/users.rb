FactoryBot.define do

  factory :user do
    name            {'tarou'}
    email           {'sample@gmail.com'}
    password        {'foobar'}
    birthday        {'1996-01-01'}
    job             {'公務員'}
    work_span       {5}
  end
end