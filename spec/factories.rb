FactoryBot.define do
  factory :link do
    title { "Testing Rails" }
    url { "http://testingrailsbook.com" }
  end

  trait :invalid do
    url { nil }
  end
end
