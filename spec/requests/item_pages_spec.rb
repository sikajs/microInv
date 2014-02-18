require 'spec_helper'

describe "Item Pages" do
  
  subject { page }
  
  describe "Item detail page" do
    let(:item) { FactoryGirl.create(:item) }
    before { visit item_path(item) }
    
    it { should have_content(item.item_id) }
    it { should have_content(item.barcode) }
    it { should have_content(item.item_name) }
    it { should have_content(item.item_name_en) }
    it { should have_content(item.color) }
    it { should have_content(item.stock) }
    it { should have_content(item.unit_cost) }
    it { should have_content(item.unit_price) }
  end
  
  describe "Add new item page" do
    before { visit new_item_path }
    
    it { should have_content('Add New Item') }
    it { should have_content('Item name') }
    
    let(:submit) { "Create Item" }
    
    describe "with invalid item information" do
      it "should not create an item" do
      	pending "not implement yet"
      	expect { click_button submit }.not_to change(Item, :count)
      end
    end
    
    describe "with valid item information" do
      before do
      end
      
      it "should create an item" do
      	pending "not implement yet"
      	expect { click_button submit }.to change(Item, :count).by(1)
      end
    end
    
  end
end
