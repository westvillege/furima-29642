class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  private
  
  def message_params
    params.require(:item).permit(:product, :image).merge(user_id: current_user.id)
  end
end
