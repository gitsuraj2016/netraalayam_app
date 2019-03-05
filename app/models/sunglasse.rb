class Sunglasse < ApplicationRecord
	belongs_to :store
	belongs_to :product
  	has_many :inventory_items
end
