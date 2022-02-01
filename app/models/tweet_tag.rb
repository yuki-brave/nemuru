class TweetTag
  include ActiveModel::Model
  attr_accessor :title, :text, :mind_id, :category_id, :time_zone_id, :user_id

  with_options presence: true do
    validates :title, :text, :user_id
  end
  validates :mind_id, :category_id, :time_zone_id, numericality: { other_than: 1, message: 'を選択してください' }

  def save
    Tweet.create(title: title, text: text, mind_id: mind_id, category_id: category_id, time_zone_id: time_zone_id, user_id: user_id)
  end
end