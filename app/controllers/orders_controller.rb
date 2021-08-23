class OrdersController < ApplicationController
  
  def index
    @order = Order.new(order_params)
    @item = Item.find(params[:item_id])
  end
   
  def new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order_destination = OrderDestination.new(order_params)   
     if @order_destination.valid?
       pay_item
       @order_destination.save
       redirect_to root_path
     else
       render action: :index
     end
  end

  private
 
  def order_params
   params.permit(:postal_code,:prefecture_id, :city, :ad_detail, :building, :phone, :item_id).merge(token: params[:token], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_" 
      Payjp::Charge.create(
        price: order_params[:id],
        card: order_params[:token],    
        currency: 'jpy'                 
      )
  end

end
