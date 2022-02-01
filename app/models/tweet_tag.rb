class TweetTag
  include ActiveModel::Model
  attr_accessor(
    :title, :text, :mind_id, :category_id, :time_zone_id, :user_id,
    :id, :created_at, :datetime, :updated_at, :datetime,
    :tag_name
  )

  with_options presence: true do
    validates :title, :text, :user_id
  end
  validates :mind_id, :category_id, :time_zone_id, numericality: { other_than: 1, message: 'を選択してください' }

  def save
    tweet = Tweet.create(title: title, text: text, mind_id: mind_id, category_id: category_id, time_zone_id: time_zone_id, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    TweetTagRelation.create(tweet_id: tweet.id, tag_id: tag.id)
  end

  def update(params, tweet)
    tweet.update(params)
  end
end