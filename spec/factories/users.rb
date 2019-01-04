FactoryBot.define do
  factory :user do
    email { "email" }
    password_digest { "password" }
    api_key { "12344568" }
  end
end
