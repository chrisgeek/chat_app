FactoryBot.define do
  factory :group do
    name { Faker::Company.name }
    description { Faker::Lorem.paragraph }
    users { |u| [u.association(:user)] }
  end
end
