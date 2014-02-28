require 'spec_helper'

describe "Order Pages" do
	
  subject { page }
  
  describe "New order page" do
    before do
      visit new_order_path
    end
    
    it { should have_content('New Order') }
    it { should have_content('Order date') }
    it { should have_content('Item in order') }
  end
  
  describe "in Index page" do
    
  end
  
  describe "in order detail page" do
    let(:order) { FactoryGirl.create(:order) }
    before do
      visit order_path(order) 
    end
    
    it { should have_content("Order detail") }
  end
end
