FactoryBot.define do
  factory :patient do
    past_history { "no" }
    allergy { "no allergy" }
    association :doctor
  end
end
