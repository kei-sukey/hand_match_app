class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: 'ピアス' },
    { id: 2, name: 'イヤリング・ノンホールピアス' },
    { id: 3, name: 'ネックレス・ペンダント' },
    { id: 4, name: 'ブレスレット・バングル' },
    { id: 5, name: '指輪・リング' },
    { id: 6, name: 'ヘアアクセサリー' },
    { id: 7, name: 'コサージュ' },
    { id: 8, name: 'ブローチ' },
    { id: 9, name: 'ピンバッチ' },
    { id: 10, name: 'アンクレット' },
    { id: 11, name: 'ネイルチップ・ネイルシール' },
    { id: 12, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end