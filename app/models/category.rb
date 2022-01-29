class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'アウトドア' },
    { id: 3, name: 'インドア' },
    { id: 4, name: 'ペット' },
    { id: 5, name: 'グルメ' },
    { id: 6, name: '旅行' },
    { id: 7, name: 'スポーツ' },
    { id: 8, name: '恋愛' },
    { id: 9, name: '趣味' },
    { id: 10, name: '友達' },
  ]

  include ActiveHash::Associations
  has_many :tweet
end