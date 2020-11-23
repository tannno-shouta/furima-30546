class OrderAddress
  include ActiveModel::Model
  attr_accessor  :token , :user_id , :item_id , :postcode , :area_id , :municipality , :address , :building , :tel 



  with_options presence: true do
    validates :token
    validates :postcode,  format: { with:/\A\d{3}[-]\d{4}\z/}
    validates :municipality
    validates :address
    validates :tel,       format: { with:/\A\d{11}\z/}
    validates :tel,       format: { with:/\A[-]?[0-9]+(\.[0-9]+)?\z/}
  end
    validates :area_id,   numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id,item_id: item_id )
    Address.create( postcode: postcode, area_id: area_id, municipality: municipality,address: address,building: building,tel: tel , order_id:order.id )
  end

end