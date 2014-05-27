class Adjusthistory < ActiveRecord::Base
  self.table_name = "adjust_history"
  
  belongs_to :item
end

