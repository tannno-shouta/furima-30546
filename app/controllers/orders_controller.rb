class OrdersController < ApplicationController
  before_action  :common_processing,  only:[:index, :create]

  def index
    @orderaddress = OrderAddress.new
  end

  def create
    @orderaddress = OrderAddress.new(orderaddress_params)
    
    if  @orderaddress.valid?
        pay_item
        @orderaddress.save
        redirect_to root_path
    else
      render :index
    end
  end

  private
  def orderaddress_params
    params.require(:order_address).permit( :postcode,:area_id,:municipality,:address,:building,:tel ).merge(user_id: current_user.id, item_id:params[:item_id] ,token: params[:token])
  end

  def common_processing
  @item = Item.find(params[:item_id])
  end

  def pay_item
    
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount:  @item[:price], 
      card: orderaddress_params[:token], 
      currency: 'jpy'
    )
  end

end
