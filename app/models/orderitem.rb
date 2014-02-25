class Orderitem < ActiveRecord::Base
  self.table_name = "order_items"
  
  belongs_to :order
  belongs_to :item
end
