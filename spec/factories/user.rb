FactoryBot.define do
  factory :user do
    first_name { "Mark" }
    last_name { "Zuckerberg" }
    email { "markz@test.com" }
    password_digest { "123456789" }
  end
end