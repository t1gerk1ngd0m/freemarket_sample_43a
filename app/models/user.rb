class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        nickname:     auth.info.name,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

  enum prefecture: {
    "--未選択--":0,北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
    validates :tel_confirmation
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :zip
    validates :prefecture
    validates :city
    validates :block
    validates :card_number
    validates :expiration_month
    validates :expiration_year
    validates :security_code
    end

  with_options uniqueness: true do
    validates :nickname
    validates :email
    validates :tel_confirmation
    validates :card_number
  end

  with_options format: { with: /\A[ァ-ヴ]+\z/ } do
    validates :first_name_kana
    validates :last_name_kana
  end

  validates :email,
    format: { with: /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z/ }
  validates :password,
    confirmation: true,
    format: { with: /\A[a-zA-Z0-9]{6,}+\z/ }
  validates :tel_confirmation,
    format: { with: /\A[0-9]{10,11}+\z/ }
  validates :zip,
    format: { with: /\A[0-9]{3}\-[0-9]{4}+\z/ }
  validates :prefecture,
    format: { with: /\A(?!.*--未選択--).*\z/ }
  validates :card_number,
    format: { with: /\A[0-9]{14,16}+\z/ }
  validates :security_code,
    format: { with: /\A[0-9]{3,4}+\z/ }
  validates :provider,
    allow_blank: true,
    inclusion: { in: %w(facebook google_oauth2) }
  validates :uid,
    allow_blank: true,
    numericality: { only_integer: true }
end
