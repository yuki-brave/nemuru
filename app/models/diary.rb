class Diary < ApplicationRecord
  with_options presence: true do
    validates :start_time, :title, :text
  end
  
  belongs_to :user
end
