require 'spec_helper'

describe "Supplier Pages" do
	
  subject { page }
  
  describe "in Supplier list page" do
    before do
      #FactoryGirl.create(:supplier, suppl_name: "test supplier1", business_num: "990")
      #FactoryGirl.create(:supplier, suppl_name: "test supplier2", business_num: "991")
      visit suppliers_path
    end
    
    it { should have_content('Supplier list') }
    it { should have_link('Add new supplier') }
    it { should have_link('Supplier ID') }
    it { should have_link('Supplier name') }
    it "has the filter/search field to change the showing result of the list" do
      pending "not implement yet"
    end
    
    it "should list each supplier" do
      # have order command because we want to force it toorder by id 
      Supplier.paginate(page: 1).order('supplier_id ASC').each do |supplier|
        expect(page).to have_selector("td", text: supplier.suppl_name)
        expect(page).to have_link('Edit')
      end
    end
  end
  
  describe "in Supplier detail page" do
    let(:supplier) { FactoryGirl.create(:supplier) }
    before do
      visit supplier_path(supplier)
    end
    
    it { should have_content(supplier.supplier_id) }
    it { should have_content(supplier.suppl_name) }
    it { should have_content(supplier.business_num) }
    it { should have_content(supplier.updated_at) }
    it { should have_link('Back to list', href: suppliers_path) }
  end
  
  describe "Add new supplier" do
    before { visit new_supplier_path }
    
    it { should have_content('Add new supplier') }
    
    let(:submit) { "Create" }
    
    describe "with invalid supplier information" do
      it "should not create an supplier" do
      	expect { click_button submit }.not_to change(Supplier, :count)
      end
    end
    
    describe "with valid supplier informatio" do
       before do
      	 visit new_supplier_path 
        fill_in "Suppl name",		with:"Test supplier"
        fill_in "Business num",		with:"999"
        fill_in "Suppl tel",		with:"021234567"
        fill_in "Suppl fax",		with:"027654321"
        fill_in "Suppl mobile",		with:"0903335678"
        fill_in "Suppl email",		with:"test@example.com"
        fill_in "Suppl address",	with:"12-14 hah road, Bangkok"
      end
      
      it "should create a supplier" do
        expect { click_button submit }.to change(Supplier, :count).by(1)
      end
    end
  end
  
  describe "edit supplier detail page" do
    let(:supplier) { FactoryGirl.create(:supplier) }
    before do
      visit edit_supplier_path(supplier)
    end
    
    describe "page" do
      it { should have_content('Edit supplier detail') }
    end
    
    describe "with invalid information" do
      let(:new_name) { " " }
      before do
      	fill_in "Suppl name",	with: new_name
      	click_button "Save changes"
      end
      
      it "displays the error message" do
      	 should have_selector('div.bg-danger')
      end
    end
    
    describe "with valid information" do
      let(:new_name) { "New name" }
      before do
      	fill_in "Suppl name",	with: new_name
      	click_button "Save changes"
      end
      
      it { should have_selector('div.bg-success') }
      specify { expect(supplier.reload.suppl_name).to eq new_name }
    end
  end
  
  describe "delete supplier" do
    let(:supplier) { FactoryGirl.create(:supplier) }
    before do
      visit suppliers_path
    end
    
    it "test itself has problem, so pending" do
      pending ""
      it { should have_link('Delete') }
      it "should be able to delete one supplier once" do
        expect do
          click_link('Delete', match: :first)
        end.to change(Supplier, :count).by(-1)
      end
    end
  end
end
