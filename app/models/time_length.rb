class TimeLength < ActiveHash::Base
  self.data = [
    { id: 1, name: '短い' },
    { id: 2, name: '普通' },
    { id: 3, name: '長い' }
  ]

  include ActiveHash::Associations
  has_many :tweets
end