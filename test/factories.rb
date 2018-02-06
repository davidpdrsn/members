FactoryBot.define do
  factory :member do
    first_name "John"
    middle_name  "Dude"
    last_name  "Doe"
    date_of_birth 10.years.ago
    membership_type :active
  end
end
