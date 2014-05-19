# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "helenemartin@yahoo.com"
    password "password"
    password_confirmation "password"
  end
end
