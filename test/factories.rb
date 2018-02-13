FactoryBot.define do
  factory :member do
    sequence(:first_name) { |i| "John #{i}" }
    sequence(:middle_name) { |i| "Doe #{i}" }
    sequence(:last_name) { |i| "Dude #{i}" }
    date_of_birth 10.years.ago
    membership_type :active
    sequence(:email) { |i| "admin_#{i}@example.com" }
    admission_date { Date.today }
  end

  factory :user do
    sequence(:email) { |i| "admin_#{i}@example.com" }
    password "secret"
  end
end
