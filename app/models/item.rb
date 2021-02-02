class Item < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :color
  belongs_to :size
  belongs_to :material
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_day

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :user_id
    validates :image
    with_options numericality: { other_than: 0,
                                 message: 'を選択してください' } do
      validates :category_id
      validates :color_id
      validates :size_id
      validates :material_id
      validates :delivery_charge_id
      validates :prefecture_id
      validates :shipping_day_id
    end
    validates :price, numericality: { only_integer: true,
                                      message: 'は半角数字で入力してください' }
  end
  validates :price, numericality: { greater_than_or_equal_to: 300,
                                    less_than_or_equal_to: 9_999_999,
                                    message: 'は¥300〜9,999,999の範囲で設定してください' }
end
