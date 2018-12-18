class CreateProgressiveDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :progressive_details do |t|
      t.string :repd
      t.string :lepd
      t.string :befh
      t.string :ed
      t.references :customer, foreign_key: true
      t.timestamps
    end
  end
end
