class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.text :address
      t.string :profession
      t.string :email
      t.string :mobile
      t.string :gender
      t.string :age
      t.string :major_complaint
      t.text :ocular_history
      t.string :medical_history
      t.string :current_medication
      t.string :dob
      t.string :anniversary_date
      t.string :cur_date

      t.timestamps
    end
  end
end
