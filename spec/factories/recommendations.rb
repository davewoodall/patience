FactoryBot.define do
  factory :recommendation do
    user
    number { Faker::IDNumber.valid }
    issuer { Faker::PrincessBride.character }
    state { "CO" }
    expiration { Faker::Date.birthday(18, 95) }
  end
end
