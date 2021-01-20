class Material < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: 'シルバー' },
    { id: 2, name: 'ゴールド' },
    { id: 3, name: '樹脂・レジン' },
    { id: 4, name: 'ビーズ・スワロ' },
    { id: 5, name: 'プラスティック' },
    { id: 6, name: '皮・革・レザー' },
    { id: 7, name: '木材' },
    { id: 8, name: 'リボン' },
    { id: 9, name: 'ガラス' },
    { id: 10, name: '真鍮' },
    { id: 11, name: '天然石' },
    { id: 12, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end