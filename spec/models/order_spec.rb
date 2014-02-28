require 'spec_helper'

describe Order do
  before do
    @order = Order.new 
  end

  subject { @order }

  it { should respond_to(:discount) }
  it { should respond_to(:cash_received) }
  it { should respond_to(:change) }
  it { should respond_to(:comment) }
  it { should respond_to(:order_cost) }

  describe "When received cash is blank" do
    before { @order.cash_received = " " }
    it { should_not be_valid }
  end
  
  describe "When change is blank" do
    before { @order.change = " " }
    it { should_not be_valid }
  end
end
