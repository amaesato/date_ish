FactoryGirl.define do
  factory :user do
    first_name 'test'
    last_name 'test'
    gender 'female'
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end
end
