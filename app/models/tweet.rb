class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :mind
  belongs_to :category
  belongs_to :time_zone
  belongs_to :user
  has_many :tweet_tag_relations
  has_many :tags, through: :tweet_tag_relations

  def self.search(search)
    if search != ""
      Tweet.where('title LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
end
