class Color < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '白' },
    { id: 2, name: '黒' },
    { id: 3, name: '灰' },
    { id: 4, name: '茶' },
    { id: 5, name: 'ベージュ' },
    { id: 6, name: '緑' },
    { id: 7, name: '青' },
    { id: 8, name: '紫' },
    { id: 9, name: '黄' },
    { id: 10, name: 'ピンク' },
    { id: 11, name: '赤' },
    { id: 12, name: 'オレンジ' },
    { id: 13, name: 'シルバー' },
    { id: 14, name: 'ゴールド' },
    { id: 15, name: '柄物' },
    { id: 16, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end