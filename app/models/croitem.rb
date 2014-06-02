class Croitem < ActiveRecord::Base
  self.table_name = "cro_items"
  
  belongs_to :cro
  belongs_to :item
  
  def get_item_name
    Item.find(self.item_id).item_name
  end
  
  def get_subtotal
    self.price.to_i * self.qty.to_i
  end
end
