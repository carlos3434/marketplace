FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(specifier: 5..10) }
    password { 'password' }
    email { Faker::Internet.unique.email }
  end
end
