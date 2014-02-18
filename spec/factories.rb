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
end
