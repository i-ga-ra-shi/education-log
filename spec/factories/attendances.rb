FactoryBot.define do
    factory :attendance do
      status {"欠席"}
      reason {Faker::Lorem.paragraph}
      start_time {Faker::Time.between(from: DateTime.now , to: DateTime.now + 1.year)}
      association :user
      association :student
    end
end