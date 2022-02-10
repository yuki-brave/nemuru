class Mind < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ポジティブ' },
    { id: 2, name: 'ネガティブ' },
    { id: 3, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :tweets
  has_many :diaries
end
