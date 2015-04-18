FactoryGirl.define do
  factory :user do
  email "MyString@example.com"
  password "MyString"
  created_at Time.new(1993, 02, 24, 12, 0, 0, "+09:00")
  end
end
