class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, except: [:index, :create]


  def index
    @order_destination = OrderDestination.new
    redirect_to root_path if (current_user.id == @item.user_id) || @item.order.present?
  end

  def new
  end

  def create
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

  def set_item
    @item = Item.find(params:item_id])
  end

  def order_params
    params.require(:order_destination).permit(:postal_code, :prefecture, :city, :ad_detail, :building, :phone).merge(
      token: params[:token], user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
