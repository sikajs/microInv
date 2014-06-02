class Customer < ActiveRecord::Base
  self.per_page = 20
  
  validates :cust_name, presence: true
  has_many :orders, inverse_of: :customer
  has_many :cros, inverse_of: :customer
end
