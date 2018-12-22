class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :item_id
      t.integer :quantity
      t.decimal :price ,:precision => 8, :scale => 2
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
