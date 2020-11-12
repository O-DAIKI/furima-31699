class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find

  def index
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.order != nil
      redirect_to root_path
    else
      @address_order = AddressOrder.new
    end
  end

  def create
    @address_order = AddressOrder.new(order_params)
    if @address_order.valid?
      pay_item
      @address_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_find
    @item = Item.find_by(id: params[:item_id])
  end

  def order_params
    params.require(:address_order).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :phone_num).merge(item_id: @item.id, user_id: current_user.id, token: params[:token], price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
