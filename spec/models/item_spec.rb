require 'spec_helper'

describe Item do
  before do
    @item = Item.new( item_name: "Example", 
    	              item_name_en: "Test yarn", 
                      stock: 10, 
                      brand: "S&C",
                      unit_cost: 10.25, 
                      unit_price: 31.00,
                      barcode: "140001523", 
                      color: "523", 
                      active: true, 
                      initial_stock: 10,
                      category: "Yarn" ) 
  end

  subject { @item }

  it { should respond_to(:item_name) }
  it { should respond_to(:item_name_en) }
  it { should respond_to(:stock) }
  it { should respond_to(:brand) }
  it { should respond_to(:initial_stock) }
  it { should respond_to(:unit_cost) }
  it { should respond_to(:unit_price) }
  it { should respond_to(:barcode) }
  it { should respond_to(:color) }
  it { should respond_to(:active) }
  it { should respond_to(:category) }

  describe "When name is not present" do
    before { @item.item_name = " " }
    it { should_not be_valid }
  end
  
  describe "When barcode is not present" do
    before { @item.barcode = " " }
    it { should_not be_valid }
  end
  
  describe "When stock is not present" do
    before { @item.stock = " " }
    it { should_not be_valid }
  end
  
  describe "when barcode is too long" do
    before { @item.barcode = "2" * 10 }
    it { should_not be_valid }
  end
  
  describe "when barcode contains non-number" do
    it "should be invalid" do
      barcode = %w[a12345678 0+1234567 _1234.567]
      barcode.each do |invalid_barcode|
        @item.barcode = invalid_barcode
        expect(@item).to be_invalid
      end
    end    
  end
  
  describe "when barcode is in correct format" do
    it "should be valid" do
      barcode = %w[123456789 140014567 020032000]
      barcode.each do |valid_barcode|
        @item.barcode = valid_barcode
        expect(@item).to be_valid
      end
    end
  end
  
  describe "when barcode is already taken" do
    it "should be invalid" do
      pending "strang situation keeps appearing"
    end
  end
end
