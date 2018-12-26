FactoryBot.define do
  factory :identification do
    user
    number { Faker::IDNumber.valid }
    state { "CO" }
    expiration { Faker::Date.birthday(18, 95) }
  end
end
