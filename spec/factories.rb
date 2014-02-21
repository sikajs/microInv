FactoryGirl.define do
  factory :item do
    item_name "Example" 
    item_name_en "Test yarn"
    stock 10 
    brand "S&C"
    unit_cost 10.25
    unit_price 31.00
    barcode "149900999" 
    color "999"
    active true
    initial_stock 10
    category "Yarn"
  end
  
  factory :supplier do
    suppl_name "Test supplier"
    business_num "789"
    suppl_tel "021234567"
    suppl_fax "027654321"
    suppl_mobile "0903335678"
    suppl_email "test@example.com"
    suppl_address "102-104 haha road, Nong Khae, Saraburi"
  end
end
