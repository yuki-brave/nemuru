class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '感情・感覚の夢' },
    { id: 2, name: '死についての夢' },
    { id: 3, name: '出来事・行事の夢' },
    { id: 4, name: '美容・健康の夢' },
    { id: 5, name: '趣味・娯楽の夢' },
    { id: 6, name: 'グルメの夢' },
    { id: 7, name: '動植物の夢' },
    { id: 8, name: '環境・自然の夢' },
    { id: 9, name: '災害・闘いの夢' },
    { id: 10, name: '悪夢' },
    { id: 11, name: '明晰夢' },
    { id: 12, name: '金縛り' },
    { id: 13, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :tweet
end
