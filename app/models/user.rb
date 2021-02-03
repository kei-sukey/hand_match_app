class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  validates :password,        format: { with: PASSWORD_REGEX,
                                        message: 'は半角英字と数字両方を含めて設定してください' }
  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/,
                                    message: 'は全角で入力して下さい' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/,
                                     message: 'は全角で入力して下さい' }
    validates :last_kana_name, format: { with: /\A[ァ-ヶー－]+\z/,
                                         message: 'は全角カナで入力して下さい' }
    validates :first_kana_name, format: { with: /\A[ァ-ヶー－]+\z/,
                                          message: 'は全角カナで入力して下さい' }
    validates :birthday
  end
end
