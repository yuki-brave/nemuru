class Diary < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :mind
  belongs_to :category
  belongs_to :time_length
  belongs_to :user

  with_options presence: true do
    validates :start_time, :title, :text
  end
end
