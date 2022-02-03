class Mind < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ポジティブ' },
    { id: 3, name: 'ネガティブ' },
    { id: 4, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :tweets
end
