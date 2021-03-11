class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  
  def item_params
    params.require(:item).permit(:product, :image, :description, :price, :category_id, :condition_id, :fee_id, :prefecture_id, :time_id ).merge(user_id: current_user.id)
  end
end
