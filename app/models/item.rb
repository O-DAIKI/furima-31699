class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_from
  belongs_to :shipping_day

  with_options presence: true do
    validates :image
    validates :name
    validates :text
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :shipping_from_id
    validates :shipping_day_id
  end

  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }

end
