class CreateRecommendations < ActiveRecord::Migration[5.2]
  def change
    create_table :recommendations do |t|
      t.string :frame_recom
      t.string :lens_recom
      t.string :coating_recom
      t.string :csa_recom
      t.string :sunrx_recom
      t.string :frame_fp
      t.string :lens_fp
      t.string :coating_fp
      t.string :csa_fp
      t.string :sunrx_fp
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
