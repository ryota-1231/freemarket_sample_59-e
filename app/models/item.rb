class Item < ApplicationRecord

  validates :title, presence:true, 
  length:{ maximum:40 } 
  validates :explanation, presence: true, 
  length:{ maximum:1000 }
  validates :status_id, presence: true, numericality: true
  validates :price,
  numericality:{greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :category_id, presence: true, numericality: true

  # validates :sizetype_id

  

  has_many :comments
  has_many :messages
  has_many :images, dependent: :destroy
  has_many :goods, dependent: :destroy
  # has_many :users, through: :goods
  has_many :good_users, through: :goods, source: :user

  has_many :solds
  has_many :users,  through:  :solds
  

  belongs_to :user, optional: true
  belongs_to :brand, optional: true
  belongs_to :category, optional: true
  belongs_to :seller, optional: true
  belongs_to :buyer, optional: true
  belongs_to :delivery, optional: true
  belongs_to :sizetype,optional: true
  belongs_to :status, optional: true

  # def gooted? (good_user_id, good_item_id)
  #   likes.where(user_id: good_user_id, item_id: good_item_id).exists?
  # end

  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :delivery


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status

  def self.search(search)
    Item.all unless search
    Item.where(['title LIKE ?', "%#{search}%"])
  end

  def good_user(user_id)
    goods.find_by(user_id: user_id)
  end

  enum purchase: { exhibiting: 0, soldout: 1, trading: 2 }

  private

  ransacker :goods_count do
    query = '(SELECT COUNT(goods.item_id) FROM goods where goods.item_id = items.id GROUP BY goods.item_id)'
    Arel.sql(query)
  end
end