require 'spec_helper'

describe Supplier do
  before do
    @supplier = Supplier.new()
  end
  
  subject { @supplier }
  
  it { should respond_to(:suppl_name) }
  it { should respond_to(:business_num) }
  it { should respond_to(:suppl_tel) }
  it { should respond_to(:suppl_fax) }
  it { should respond_to(:suppl_mobile) }
  it { should respond_to(:suppl_email) }
  it { should respond_to(:suppl_address) }
  
  describe "when supplier name is blank" do
    before { @supplier.suppl_name = " " }
    it { should_not be_valid }
  end
  
  describe "when business number is blank" do
    before { @supplier.business_num = " " }
    it { should_not be_valid }
  end
  
  
end
