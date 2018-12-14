class CreateFrames < ActiveRecord::Migration[5.2]
  def change
    create_table :frames do |t|
      t.string :product_name
      t.string :brand_name
      t.string :frame_type
      t.string :frame_shape
      t.string :model_no
      t.string :frame_size
      t.string :bridge_size
      t.string :temple_size
      t.string :eye_size
      t.string :frame_color
      t.string :glass_color
      t.string :weight
      t.string :frame_material
      t.string :temple_material
      t.string :collection
      t.string :lens_material
      t.string :gender
      t.string :height
      t.string :condition
      t.string :temple_color
      t.string :no_s
      t.decimal :MRP , :precision => 8, :scale => 2
      t.decimal :NRP , :precision => 8, :scale => 2
      t.decimal :discount , :precision => 8, :scale => 2
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
