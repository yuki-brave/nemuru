FactoryBot.define do
  factory :tweet_tag do
    title        { Faker::Lorem.word }
    text         { Faker::Lorem.sentence }
    thoughts     { Faker::Lorem.sentence }
    tag_name     { Faker::Lorem.word }
    mind_id      { Faker::Number.within(range: 2..4) }
    category_id  { Faker::Number.within(range: 2..12) }
    time_zone_id { Faker::Number.within(range: 2..5) }
  end
end
