class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  private
  
  def item_params
    params.require(:item).permit(:product, :image).merge(user_id: current_user.id)
  end
end
