class Restockhistory < ActiveRecord::Base
  self.table_name = "restock_history"
  self.per_page = 20
  
  belongs_to :item
end

