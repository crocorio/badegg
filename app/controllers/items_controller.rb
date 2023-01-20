class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show]
  def index
    @items = Item.all.order('id DESC')
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


  private

  def item_params
    params.require(:item).permit(:name, :image, :description,
                                :shipping_cost_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  
  def set_item
    @item = Item.find(params[:id])
  end

end

