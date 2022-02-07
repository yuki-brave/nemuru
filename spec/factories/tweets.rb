FactoryBot.define do
  factory :tweet do
    title        { Faker::Lorem.word }
    text         { Faker::Lorem.sentence }
    thoughts     { Faker::Lorem.sentence }
    mind_id      { Faker::Number.within(range: 2..4) }
    category_id  { Faker::Number.within(range: 2..12) }
    time_length_id { Faker::Number.within(range: 2..4) }
    association :user
  end
end
