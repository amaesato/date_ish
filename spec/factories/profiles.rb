FactoryGirl.define do
  factory :profile do
    favorite_item "MyString"
    favorite_swearword "MyString"
    active false
    interests "MyString"
    user
  end
end
