class Supplier < ActiveRecord::Base
  self.primary_key = "supplier_id"
  self.per_page = 20
  
  validates :suppl_name, presence: true
  validates :business_num, presence: true
  
  has_many :items
end
