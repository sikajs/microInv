class Supplier < ActiveRecord::Base
  self.primary_key = "supplier_id"
  
  validates :suppl_name, presence: true
  validates :business_num, presence: true
  self.per_page = 20
end
