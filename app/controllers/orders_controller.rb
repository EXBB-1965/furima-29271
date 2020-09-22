class OrdersController < ApplicationController
  before_action :move_to_sign_up, except: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :correct_access, only: [:index]

  def index
    @order = OrderAddressForm.new
  end

  def create
    @order = OrderAddressForm.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      @item.update(buyer_id: current_user.id)
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def move_to_sign_up
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def correct_access
    set_item
    if current_user.id == @item.saler_id || @item.buyer_id.present?
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_address_form).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    set_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end