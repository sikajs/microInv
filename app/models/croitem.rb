class Croitem < ActiveRecord::Base
  self.table_name = "cro_items"
  
  belongs_to :cro
  belongs_to :item
  
end
