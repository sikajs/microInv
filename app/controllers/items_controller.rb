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
    # this will break the test if using :per_page smaller than 30 in here
    # but put :per_page variable in the model won't
    # trying to make search via texfield input, but haven't succeeded
    if params[:item_search]
      @items = Item.where('barcode LIKE ?', params[:item_search]).paginate(:page => params[:page]).order(sort_column + " " + sort_direction)
    else
      @items = Item.paginate(:page => params[:page]).order(sort_column + " " + sort_direction)
    end
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
  
  def activate
    @item = Item.find(params[:item_id])
    if @item.update_attribute(:active, TRUE)
      flash[:success] = "Item activated!"
      redirect_to @item
    end
  end
  
  def deactivate
    @item = Item.find(params[:item_id])
    if @item.update_attribute(:active, FALSE)
      flash[:success] = "Item 	deactivated!"
      redirect_to @item
    end
  end
  
  def restock
    @item = Item.find(params[:item_id])
    #render the form for enter the new cost and qty
  end
  
  def restock_update
    @item = Item.find(params[:item_id])
    # better to secure the parameters later
    if params[:new_arrival_stock].to_i > 0
      #update the stock with the entered data
      new_stock = @item.stock + params[:new_arrival_stock].to_i
      new_cost = (@item.unit_cost * @item.stock + params[:new_arrival_cost].to_f * params[:new_arrival_stock].to_i) / new_stock
      @item.unit_cost = new_cost
      @item.stock = new_stock
      @item.save!
      # need to update the restock history as well
      flash[:success] = "Item restocked."
      redirect_to @item
    else
      flash[:error] = "Wrong new arrival stock number!"
      render 'restock'
    end
    #binding.pry
  end
  
  def getByBarcode
    @item = Item.find_by barcode: params[:barcode]
    respond_to do |format|
      if @item.blank?
      	data = '{"error": "Item not found"}'
      	format.json { render :json => data }
      else
        format.json { render :json => @item }
      end
    end  
  end
  
  private
    def item_params
      params.require(:item).permit(:item_name, :item_name_en, :supplier_id,
      	                           :unit_cost, :unit_price,
      	                           :stock, :color,
      	                           :brand, :barcode)
    end
end
