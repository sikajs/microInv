class Order < ActiveRecord::Base
  self.per_page = 20
  
  validates :cash_received, presence: true
  validates :change, presence: true
  
  belongs_to :customer, inverse_of: :orders 	
  has_many :orderitems, :dependent => :destroy
  has_many :items, :through => :orderitems
  accepts_nested_attributes_for :orderitems,
    :reject_if => lambda { |a| a[:barcode].blank? }
end
