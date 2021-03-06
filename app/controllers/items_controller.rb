class ItemsController < ApplicationController
  before_action :authenticate_user! , except: [:index ,:show]
  before_action :common_processing, only: [:edit, :update,:show,:destroy]
  before_action :editing_restrictions, only: [:edit]

  
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
      @item = Item.new(item_params)
    if  @item.save
        redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user == @item.user
    @item.destroy
    redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit( :image, :product, :message, :category_id, :status_id, :shipping_id, :area_id, :day_id, :price ).merge(user_id: current_user.id)
  end

  def common_processing
  @item = Item.find(params[:id])
  end

  def editing_restrictions
    if current_user.id != @item.user.id || @item.order 
      redirect_to root_path
    end
  end

end