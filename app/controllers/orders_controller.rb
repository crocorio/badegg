class OrdersController < ApplicationController
  #before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  #before_action :move_to_index, only: [:index, :create]
  
  def index
    @order_destination = OrderDestination.new
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      pay_item
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

  def order_params
    params.require(:order_destination).permit(:postal_code, :prefecture_id,
                                              :city, :block, :building, :phone_number, :email).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end
