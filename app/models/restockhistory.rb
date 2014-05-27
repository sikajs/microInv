class Restockhistory < ActiveRecord::Base
  self.table_name = "restock_history"
  
  belongs_to :item
end

