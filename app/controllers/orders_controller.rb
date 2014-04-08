class OrdersController < ApplicationController  
  before_action :check_items, only: [:create]
  
  def new
    @order = Order.new
    @orderitems = @order.orderitems.build
    #3.times { @order.orderitems.build }
  end

  def create
    @order = Order.new(order_params)
    @orderitems = @order.orderitems.build(orderitems_params)
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
    
    def check_items
      params[:order][:orderitems_attributes].each do |item, attr|
        if attr['item_id'] == ""
          params[:order].delete(item)
        end
      end
    end
    
    def orderitems_params   
      params[:order].require(:orderitems_attributes).permit!
    end
end
