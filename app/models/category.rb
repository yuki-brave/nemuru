class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '感情・感覚の夢' },
    { id: 2, name: '死についての夢' },
    { id: 3, name: '出来事・行事の夢' },
    { id: 4, name: '情報・ITの夢' },
    { id: 5, name: '美容・健康の夢' },
    { id: 6, name: '趣味・娯楽の夢' },
    { id: 7, name: 'グルメの夢' },
    { id: 8, name: '動植物の夢' },
    { id: 9, name: '環境・自然の夢' },
    { id: 10, name: '災害・闘いの夢' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :tweet
end
