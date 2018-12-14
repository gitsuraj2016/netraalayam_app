class CreateLens < ActiveRecord::Migration[5.2]
  def change
    create_table :lens do |t|
      t.string :product_name
      t.string :brand_name
      t.string :lens_type
      t.string :coatings1
      t.string :coatings2
      t.string :coatings3
      t.string :coatings4
      t.string :coatings5
      t.string :material
      t.string :power_range
      t.string :no_s
      t.decimal :MRP , :precision => 8, :scale => 2
      t.decimal :NRP , :precision => 8, :scale => 2
      t.decimal :discount , :precision => 8, :scale => 2
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
