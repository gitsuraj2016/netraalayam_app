class AddProductIdToLen < ActiveRecord::Migration[5.2]
  def change
  	add_column :lens, :product_id, :integer
  end
end
