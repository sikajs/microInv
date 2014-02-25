class Order < ActiveRecord::Base
  self.per_page = 20
  
  
  belongs_to :customer
  has_many :orderitems
  has_many :items, :through => :orderitems
  end
