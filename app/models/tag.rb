class Tag < ApplicationRecord
  has_many :tweet_tag_relations
  has_many :tweet, through: :tweet_tag_relations

  validates :tag_name, uniqueness: true
end
