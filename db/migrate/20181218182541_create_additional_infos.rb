class CreateAdditionalInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :additional_infos do |t|
      t.string :optomentrist_note
      t.string :remark
      t.string :pid_frame
      t.string :lense_type_a
      t.string :lense_type_b
      t.string :lense_type_c
      t.string :next_visit_date
      t.string :checked_by
      t.string :singature
      t.references :customer, foreign_key: true
      t.timestamps
    end
  end
end
