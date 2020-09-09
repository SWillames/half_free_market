FactoryBot.define do
  factory :admin do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    user_name { name.split[0].downcase+ '-' +name.split[-1].downcase }
    password { Faker::Internet.password }
  end
end
