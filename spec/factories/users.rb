FactoryGirl.define do
  factory :user do
    username   { Faker::Name.unique.name }
    ip_address "127.0.0.1"
  end
end
