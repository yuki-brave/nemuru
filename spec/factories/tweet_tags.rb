FactoryBot.define do
  factory :tweet_tag do
    title        { Faker::Lorem.word }
    text         { Faker::Lorem.sentence }
    thoughts     { Faker::Lorem.sentence }
    tag_name     { Faker::Lorem.word }
    mind_id      { Faker::Number.within(range: 1..3) }
    category_id  { Faker::Number.within(range: 1..11) }
    time_length_id { Faker::Number.within(range: 1..3) }
  end
end
