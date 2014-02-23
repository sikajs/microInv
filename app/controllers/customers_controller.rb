class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:success] = "Customer successfully created!"
      redirect_to @customer
    else
      render 'new'
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end
  
  def index
    @customers = Customer.paginate(:page => params[:page]).order('customer_id ASC')
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params)
      flash[:success] = "Customer detail updated!"
      redirect_to @customer
    else
      render 'edit'
    end
  end
  
  private
    def customer_params
      params.require(:customer).permit(:cust_name, :cust_tel, :cust_fax,
      	                               :cust_mobile, :cust_email,
      	                               :cust_address)
    end
end
