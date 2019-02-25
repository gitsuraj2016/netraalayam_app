class AddProductIdToFrames < ActiveRecord::Migration[5.2]
  def change
  	add_column :frames, :product_id, :integer
  end
end
