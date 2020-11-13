class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do

    validates :product 
    validates :message
    validates :image
    validates :price,  format: { with:/\A[-]?[0-9]+(\.[0-9]+)?\z/}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } 
  end

  with_options numericality: { other_than: 1 } do

    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :area_id
    validates :day_id
  end

    belongs_to  :category
    belongs_to  :status
    belongs_to  :shipping
    belongs_to  :area
    belongs_to  :day

    belongs_to :user
    has_one_attached :image
end
