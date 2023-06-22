FactoryBot.define do
    factory :subject do
        subject_id {Faker::Number.between(from: 2, to:8)}
        sub_subject {Faker::Lorem.sentence}
        title {Faker::Lorem.sentence}
        month_id { Faker::Number.between(from: 2, to: 13) }
        grade_id { Faker::Number.between(from: 2, to: 11) }
        name {Faker::Name.last_name}
        content {Faker::Lorem.paragraph}
        association :user
    end
end