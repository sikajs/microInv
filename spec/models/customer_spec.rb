require 'spec_helper'

describe Customer do
  before do
    @customer = Customer.new()
  end
  
  subject { @customer }
  
  it { should respond_to(:cust_name) }
  it { should respond_to(:cust_tel) }
  it { should respond_to(:cust_fax) }
  it { should respond_to(:cust_mobile) }
  it { should respond_to(:cust_email) }
  it { should respond_to(:cust_address) }
  
  describe "when custier name is blank" do
    before { @customer.cust_name = " " }
    it { should_not be_valid }
  end  
  
end
