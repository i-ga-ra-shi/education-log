FactoryBot.define do
    factory :student do
      grade {Faker::Number.between(from: 1, to:6)}
      class_number {Faker::Number.between(from: 1, to:20)}
      number {Faker::Number.between(from: 1, to:50)}
      name {Faker::Name.last_name}
      association :user
    end
  end