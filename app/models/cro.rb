class Cro < ActiveRecord::Base
  self.per_page = 20
  
  belongs_to :customer, inverse_of: :cros	
  has_many :croitems, :dependent => :destroy
  has_many :items, :through => :croitems
  accepts_nested_attributes_for :croitems,
    :reject_if => lambda { |a| a[:barcode].blank? }
end
