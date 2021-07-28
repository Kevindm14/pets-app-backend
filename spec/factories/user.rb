FactoryBot.define do
  factory :user do
    first_name { "Mark Zuckerberg" }
    email { "markz@test.com" }
    password { "123456789" }
  end
end