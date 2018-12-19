class CreatePrescriptionSpectacleNews < ActiveRecord::Migration[5.2]
  def change
    create_table :prescription_spectacle_news do |t|
      t.string :new_rgt_sph_1
      t.string :new_rgt_cyl_1
      t.string :new_rgt_axix_1
      t.string :new_rgt_sph_2
      t.string :new_rgt_cyl_2
      t.string :new_rgt_axix_2
      t.string :new_lft_sph_1
      t.string :new_lft_cyl_1
      t.string :new_lft_axix_1
      t.string :new_lft_sph_2
      t.string :new_lft_cyl_2
      t.string :new_lft_axix_2
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
