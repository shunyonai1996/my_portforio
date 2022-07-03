FactoryBot.define do
  factory :comment do
    CContent { "MyText" }
    user { nil }
    micropost { nil }
  end
end
