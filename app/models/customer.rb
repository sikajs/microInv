class Customer < ActiveRecord::Base
  self.per_page = 20
  
  validates :cust_name, presence: true
  
end
