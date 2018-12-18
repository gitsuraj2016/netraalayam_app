class CreatePrescriptionSpectacles < ActiveRecord::Migration[5.2]
  def change
    create_table :prescription_spectacles do |t|
      t.string :eye_type
      t.string :pres_type
      t.string :sph
      t.string :cyl
      t.string :axis
      t.integer :row_no
      t.references :customer, foreign_key: true


      t.timestamps
    end
  end
end
