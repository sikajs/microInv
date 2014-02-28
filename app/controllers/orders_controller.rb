class OrdersController < ApplicationController
  def new
    @order = Order.new
    3.times { @order.orderitems.build }
  end

  def create
    @order = Order.new(order_params)
    @order.orderitems.build
    if @order.save
      flash[:success] = "Order confirmed"
      redirect_to 'new'
    else
      render 'new'
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
  end
  
  private
    def order_params
      params.require(:order).permit(:customer_id, :discount, :cash_received, 
      	                            :change, :comment)
    end
end
