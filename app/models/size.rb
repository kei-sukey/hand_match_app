class Size < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '大' },
    { id: 2, name: '中' },
    { id: 3, name: '小' }
  ]

  include ActiveHash::Associations
  has_many :items
end
