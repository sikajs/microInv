class OrdersController < ApplicationController  
  
  def new
    @order = Order.new
    @orderitems = @order.orderitems.build
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      params[:order][:orderitems_attributes].each do |item, attr|
        if attr[:item_id].to_i != 0
          Orderitem.create(order_id: @order.id, 
                           item_id: attr[:item_id].to_i, 
                           barcode: attr[:barcode],
                           price: attr[:price],
                           qty: attr[:qty]
                           #curr_cost: attr[:unit_cost],
                           #margin: (attr[:price].to_i-attr[:unit_cost].to_i)
                          )
          # also need to update the stock of item(s)
          @item = Item.find(attr[:item_id].to_i)
          if @item.get_current_stock >= attr[:qty].to_i   # There is enough stock to deduct
            @item.deduct_stock(attr[:qty].to_i)
          # How about there is no enough stock, especially when the stock in system is not matched with reality
          end
          #binding.pry
        end
      end
      flash[:success] = "Order confirmed"
      redirect_to @order
    else
      render 'new'
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.paginate(:page => params[:page]).order(sort_column + " " + sort_direction)
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
    
    def orderitems_params   
      params[:order].require(:orderitems_attributes).permit!
    end
end
