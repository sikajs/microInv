class CrosController < ApplicationController
  def new
    @cro = Cro.new
    @croitems = @cro.croitems.build
  end

  def create
    @cro = Cro.new(cro_params)
    if @cro.save
      params[:cro][:croitems_attributes].each do |item, attr|
        if attr[:item_id].to_i != 0
          Croitem.create(cro_id: @cro.id, 
                         item_id: attr[:item_id].to_i, 
                         barcode: attr[:barcode],
                         price: attr[:price],
                         qty: attr[:qty]
                        )
          # also need to update the stock of item(s)
          @item = Item.find(attr[:item_id].to_i)
          @item.add_stock(attr[:qty].to_i)
          #binding.pry
        end
      end
      flash[:success] = "Cro confirmed"
      redirect_to @cro
    else
      flash[:danger] = "Cro has error"
      render :new
    end
    
  end

  def index
    @cros = Cro.paginate(:page => params[:page]).order(sort_column + " " + sort_direction)
  end
  
  def show
    @cro = Cro.find(params[:id])
  end
  
  private
  
  def cro_params
      params.require(:cro).permit(:customer_id, :return_total, :orig_discount, :croitems_attributes)
  end
end
