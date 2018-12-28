FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    dob { Faker::Date.birthday(18, 95) }
  end

  trait :with_recomendation do
    after(:create) do |user|
      create(:recommendation, user_id: user.id)
    end
  end

  trait :with_identification do
    after(:create) do |user|
      create(:identification, user_id: user.id)
    end
  end

  trait :all_data do
    after(:create) do |user|
      create(:identification, user_id: user.id)
      create(:recommendation, user_id: user.id)
    end
  end
end
