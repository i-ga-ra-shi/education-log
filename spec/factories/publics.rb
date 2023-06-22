FactoryBot.define do
    factory :public do
        association :user
        association :subject
    end
  end