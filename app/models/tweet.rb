class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :mind
  belongs_to :category
  belongs_to :time_zone
  belongs_to :user

  validates :title, :text, presence: true
  validates :mind_id, :category_id, :time_zone_id, numericality: { other_than: 1, message: "を入力してください" }
end
