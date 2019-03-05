class InventoryItem < ApplicationRecord
	belongs_to :frame, optional: true
	belongs_to :len, optional: true
	belongs_to :sunglasse, optional: true
end
