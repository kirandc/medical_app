FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "PERSON#{n}" }
    mobile {9989898776}
    name {'abc'}
    sequence(:email) { |n| "person#{n}@example.com" }
    association :role
  end
end
