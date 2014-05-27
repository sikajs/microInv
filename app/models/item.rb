class Item < ActiveRecord::Base
  self.primary_key = "item_id"
  self.per_page = 20
  
  validates :stock, presence: true
  validates :item_name, presence: true
  VALID_BARCODE_REGEX = /[0-9]{9}/
  validates :barcode, presence: true, length: { maximum: 9 },
                      format: { with: VALID_BARCODE_REGEX },
                      uniqueness: true
  
  belongs_to :supplier
  has_many :orderitems
  has_many :orders, :through => :orderitems
  
  def get_current_stock
    self.stock
  end
  
  def deduct_stock(qty)
    self.stock = self.stock - qty
    self.save
  end
  
  def add_stock(qty)
    self.stock = self.stock + qty
    self.save
  end
end
