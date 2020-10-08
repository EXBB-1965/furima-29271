class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :saler, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true
  has_many_attached :images
  has_one :order
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :payer
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :discription
    validates :images
    validates :price, numericality: { only_integer: true, greter_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    with_options numericality: {other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :payer_id
      validates :prefecture_id
      validates :shipping_day_id
    end
  end
end