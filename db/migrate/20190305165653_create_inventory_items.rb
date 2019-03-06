class CreateInventoryItems < ActiveRecord::Migration[5.2]
  def change
    create_table :inventory_items do |t|
      t.references :frame, foreign_key: true
      t.references :len, foreign_key: true
      t.references :sunglasse, foreign_key: true
      t.references :store, foreign_key: true
      t.string :inventory_type
      t.string :quantity
      t.boolean :barcode_status
      t.string :barcode
      t.timestamps
    end
  end
end
