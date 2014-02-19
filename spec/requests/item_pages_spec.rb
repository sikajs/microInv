require 'spec_helper'

describe "Item Pages" do
  
  subject { page }
  
  describe "Item index page" do
    before do
      FactoryGirl.create(:item, item_name: "product1", stock: 5, barcode: "149999000")
      FactoryGirl.create(:item, item_name: "product2", stock: 5, barcode: "149999001")
      visit items_path
    end
    
    it { should have_content('Item list') }
    
    it "should list each item" do
      # have order command because we want to force it toorder by id 
      Item.paginate(page: 1).order('item_id ASC').each do |item|
        expect(page).to have_selector("td", text: item.item_name)
      end
    end
  end
  
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
    it { should have_link('Back to list', href: items_path) }
  end
  
  describe "Add new item" do
    before { visit new_item_path }
    
    it { should have_content('Add New Item') }
    
    let(:submit) { "Create Item" }
    
    describe "with invalid item information" do
      it "should not create an item" do
      	expect { click_button submit }.not_to change(Item, :count)
      end
    end
    
    describe "with valid item information" do
      before do
      	fill_in "Item name",	with:"Test product"
      	fill_in "Unit cost",	with:"10"
      	fill_in "Unit price",	with:"20"
      	fill_in "Stock",	with:"10"
      	fill_in "Color",	with:"999"
      	fill_in "Brand",	with:"S&C"
      	fill_in "Barcode",	with:"149900999"
      end
      
      it "should create an item" do
      	expect { click_button submit }.to change(Item, :count).by(1)
      end
    end
  end
end
