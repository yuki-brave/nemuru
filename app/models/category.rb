class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '感情や感覚の夢' },
    { id: 3, name: '死についての夢' },
    { id: 4, name: '出来事や行事の夢' },
    { id: 5, name: '情報やITの夢' },
    { id: 6, name: '美容・健康の夢' },
    { id: 7, name: '趣味・娯楽の夢' },
    { id: 8, name: 'グルメの夢' },
    { id: 9, name: '動植物の夢' },
    { id: 10, name: '環境・自然の夢' },
    { id: 11, name: '災害や闘いの夢' },
    { id: 12, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :tweet
end
