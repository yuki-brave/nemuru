class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :mind
  belongs_to :category
  belongs_to :time_zone
  belongs_to :user

end
