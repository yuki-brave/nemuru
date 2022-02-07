class TimeLength < ActiveHash::Base
  self.data = [
    { id: 1, name: '----' },
    { id: 2, name: '短い' },
    { id: 3, name: '普通' },
    { id: 4, name: '長い' }
  ]

  include ActiveHash::Associations
  has_many :tweets
end