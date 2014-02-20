class Item < ActiveRecord::Base
  self.primary_key = "item_id"
  validates :stock, presence: true
  validates :item_name, presence: true
  VALID_BARCODE_REGEX = /[0-9]{9}/
  validates :barcode, presence: true, length: { maximum: 9 },
                      format: { with: VALID_BARCODE_REGEX }
  self.per_page = 20
end
