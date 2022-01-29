class Mind < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ポジティブ' },
    { id: 3, name: 'ネガティブ' }
  ]

  include ActiveHash::Associations
  has_many :tweets
end
