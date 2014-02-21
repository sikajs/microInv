class SuppliersController < ApplicationController
  def new
    @supplier = Supplier.new
  end
  
  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      flash[:success] = "Supplier successfully created!"
      redirect_to @supplier
    else
      render 'new'
    end
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def index
    @suppliers = Supplier.paginate(:page => params[:page]).order('supplier_id ASC')
  end
  
  def edit
    @supplier = Supplier.find(params[:id])
  end
  
  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update_attributes(supplier_params)
      flash[:success] = "Supplier detail updated!"
      redirect_to @supplier
    else
      render 'edit'
    end
  end
  
  def destroy
    Supplier.find(params[:id]).destroy
    flash[:success] = "Supplier successfully deleted!"
    redirect_to suppliers_path
  end
  
  private
    def supplier_params
      params.require(:supplier).permit(:suppl_name, :business_num, 
      	                               :suppl_tel, :suppl_fax,
      	                               :suppl_mobile, :suppl_email,
      	                               :suppl_address)
    end
end
