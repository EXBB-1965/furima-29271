class ItemsController < ApplicationController
  before_action :move_to_sign_up, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
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
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def move_to_sign_up
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :discription, :price, :category_id, :status_id, :payer_id, :prefecture_id, :shipping_day_id, :buyer_id).merge(saler_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end