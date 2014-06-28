class Adjusthistory < ActiveRecord::Base
  self.table_name = "adjust_history"
  self.per_page = 20
  
  belongs_to :item
end

