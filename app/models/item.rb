class Item < ApplicationRecord
  validates :title, presence:true, 
  length:{ maximum:40 } 
  validates :explanation, presence: true, 
  length:{ maximum:1000 }
  validates :status_id, presence: true, numericality: true
  validates :price,
  numericality:{greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :category_id, presence: true, numericality: true
  validates :images, length: { minimum: 1, maximum: 10 }

  has_many :comments, dependent: :destroy
  has_many :messages
  has_many :images, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_one :solds
  belongs_to :user
  belongs_to :brand, optional: true
  belongs_to :category, optional: true
  belongs_to :delivery, optional: true
  belongs_to :sizetype,optional: true
  belongs_to :status, optional: true
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