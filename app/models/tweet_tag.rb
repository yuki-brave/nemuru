class TweetTag
  include ActiveModel::Model
  attr_accessor(
    :title, :text, :thoughts, :mind_id, :category_id, :time_length_id, :user_id,
    :id, :created_at, :datetime, :updated_at, :datetime,
    :tag_name
  )

  with_options presence: true do
    validates :title, :text, :user_id
  end
  validates :mind_id, :category_id, :time_length_id, presence: {message: 'を選択してください' }

  def save
    tweet = Tweet.create(title: title, text: text, mind_id: mind_id, category_id: category_id, time_length_id: time_length_id,
                         user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    TweetTagRelation.create(tweet_id: tweet.id, tag_id: tag.id)
  end

  def update(params, tweet)
    tweet.tweet_tag_relations.destroy_all
    tag_name = params.delete(:tag_name)
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?
    tag.save if tag_name.present?
    tweet.update(params)
    TweetTagRelation.create(tweet_id: tweet.id, tag_id: tag.id) if tag_name.present?
  end
end
