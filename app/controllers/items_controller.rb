class ItemsController < ApplicationController
  before_action :move_to_sign_up, except: [:index, :show]
  before_action :set_item, only: [:show]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to root_path(id: current_user)
    else
       render 'new'
    end
  end

  def show
  end

  private

  def move_to_sign_up
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def item_params
    params.permit(:image, :name, :discription, :price, :category_id, :status_id, :payer_id, :prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
