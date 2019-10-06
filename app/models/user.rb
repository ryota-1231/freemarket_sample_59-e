class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,omniauth_providers: [:facebook, :google_oauth2]
  has_many :items
  has_many :comments
  has_many :messages
  has_many :goods
  has_many :items, through: :goods
  has_many :addresses
  has_many :cards
  has_many :sns_credentials, dependent: :destroy

  accepts_nested_attributes_for :addresses

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :year
    belongs_to_active_hash :month
    belongs_to_active_hash :day

  validates :nickname,                presence: true, length: {maximum: 20}
  validates :email,                   presence: true, uniqueness: true
  validates :password,                presence: true, length: {minimum: 7, maximum: 128}
  validates :password_confirmation,   presence: true, length: {minimum: 7, maximum: 128}
  validates :last_name,               presence: true
  validates :first_name,              presence: true
  validates :last_name_kana,          presence: true
  validates :first_name_kana,         presence: true
  validates :birthdate_year,          presence: true
  validates :birthdate_month,         presence: true
  validates :birthdate_day,           presence: true

  validates :cellphone_number,        presence: true

  validates :address_last_name,       presence: true
  validates :address_first_name,      presence: true
  validates :address_last_name_kana,  presence: true
  validates :address_first_name_kana, presence: true

  validates :card_number,             presence: true
  validates :expiration_year,         presence: true
  validates :expiration_month,        presence: true

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.find_by(uid: uid)
    
    if snscredential.present?
      user = User.find(snscredential.user_id)
      unless user.present?
        generated_password = Devise.friendly_token[0, 20]
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email,
          password: generated_password,
          password_confirmation: generated_password
        )
      end
      sns = snscredential
    else
      user = User.find_by(email: auth.info.email)
      if user.present?
        sns = SnsCredential.new(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email,
          password: generated_password,
          password_confirmation: generated_password
        )
        sns = SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      end
    end
    return { user: user, sns_id: sns.id }
  end
end
