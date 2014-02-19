class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    # hasn't deal with initial stock field
    if @item.save
      flash[:success] = "Item sucessfully added!"
      redirect_to @item
    else
      render 'new'
    end
  end
  
  def index
  end
  
  private
    def item_params
      params.require(:item).permit(:item_name, :item_name_en,
      	                           :unit_cost, :unit_price,
      	                           :stock, :color,
      	                           :brand, :barcode)
    end
end
