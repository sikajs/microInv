class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    # hasn't deal with initial stock fieldcd 
    if @item.save
      flash[:success] = "Item sucessfully added!"
      redirect_to @item
    else
      render 'new'
    end
  end
  
  def index 
    # this will break the test if using :per_page smaller than 30 in here
    # but put :per_page variable in the model won't
    @items = Item.paginate(:page => params[:page]).order('item_id ASC')
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:success] = "Item detail updated!"
      redirect_to @item
    else
      render 'edit'
    end
  end
  
  private
    def item_params
      params.require(:item).permit(:item_name, :item_name_en,
      	                           :unit_cost, :unit_price,
      	                           :stock, :color,
      	                           :brand, :barcode)
    end
end
