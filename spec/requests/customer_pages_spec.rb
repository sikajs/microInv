require 'spec_helper'

describe "Customer Pages" do
	
  subject { page }
  
  describe "in Customer list page" do
    before do
      #FactoryGirl.create(:customer, cust_name: "test customer1")
      #FactoryGirl.create(:customer, cust_name: "test customer2")
      visit customers_path
    end
    
    it { should have_content('Customer list') }
    it { should have_link('Add new customer') }
    it { should have_link('Customer ID') }
    it { should have_link('Customer name') }
    it "has the filter/search field to change the showing result of the list" do
      pending "not implement yet"
    end
    
    it "should list each customer" do
      # have order command because we want to force it to order by id 
      Customer.paginate(page: 1).order('customer_id ASC').each do |customer|
        expect(page).to have_selector("td", text: customer.cust_name)
        expect(page).to have_link('Edit')
      end
    end
  end
  
  describe "in Customer detail page" do
    let(:customer) { FactoryGirl.create(:customer) }
    before do
      visit customer_path(customer)
    end
    
    it { should have_content(customer.customer_id) }
    it { should have_content(customer.cust_name) }
    it { should have_link('Back to list', href: customers_path) }
  end
  
  describe "Add new customer" do
    before { visit new_customer_path }
    
    it { should have_content('Add New Customer') }
    
    let(:submit) { "Create" }
    
    describe "with invalid customer information" do
      it "should not create an customer" do
      	expect { click_button submit }.not_to change(Customer, :count)
      end
    end
    
    describe "with valid customer information" do
       before do
      	 visit new_customer_path 
        fill_in "Cust name",		with:"Test customer"
        fill_in "Cust tel",		with:"021234567"
        fill_in "Cust fax",		with:"027654321"
        fill_in "Cust mobile",		with:"0903335678"
        fill_in "Cust email",		with:"test@example.com"
        fill_in "Cust address",		with:"12-14 hah road, Bangkok"
      end
      
      it "should create a customer" do
        expect { click_button submit }.to change(Customer, :count).by(1)
      end
    end
  end
  
  describe "edit customer detail page" do
    let(:customer) { FactoryGirl.create(:customer) }
    before do
      visit edit_customer_path(customer)
    end
    
    describe "page" do
      it { should have_content('Edit Customer Detail') }
    end
    
    describe "with invalid information" do
      let(:new_name) { " " }
      before do
      	fill_in "Cust name",	with: new_name
      	click_button "Save"
      end
      
      it "displays the error message" do
      	 should have_selector('div.bg-danger')
      end
    end
    
    describe "with valid information" do
      let(:new_name) { "New name" }
      before do
      	fill_in "Cust name",	with: new_name
      	click_button "Save"
      end
      
      it { should have_selector('div.bg-success') }
      specify { expect(customer.reload.cust_name).to eq new_name }
    end
  end
  

end
