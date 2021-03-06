class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :mind
  belongs_to :category
  belongs_to :time_length
  belongs_to :user
  has_many :tweet_tag_relations
  has_many :tags, through: :tweet_tag_relations
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
