FactoryBot.define do
  factory :tweet do
    title        {Faker::Lorem.word}
    text         {Faker::Lorem.sentence}
    mind_id      {Faker::Number.within(range: 2..3)}
    category_id  {Faker::Number.within(range: 2..10)}
    time_zone_id {Faker::Number.within(range: 2..4)}
    association :user
  end
end
