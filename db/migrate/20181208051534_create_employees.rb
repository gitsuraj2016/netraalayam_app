class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :emp_id
      t.string :name
      t.string :mobile
      t.string :email
      t.boolean :optometrist , default: false
      t.boolean :hto , default: false
      t.boolean :manager ,default: false
      t.boolean :active , default: true

      t.timestamps
    end
  end
end
