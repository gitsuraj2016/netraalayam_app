class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :product_type
      t.integer :product_id
      t.boolean :barcode_status , default: false

      t.timestamps
    end
  end
end
