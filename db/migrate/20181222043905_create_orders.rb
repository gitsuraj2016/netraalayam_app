class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :delivery_date
      t.decimal :subtotal ,:precision => 8, :scale => 2
      t.decimal :tax_amt , :precision => 8, :scale => 2
      t.decimal :discount_amt , :precision => 8, :scale => 2
      t.decimal :total_amt , :precision => 8, :scale => 2
      t.decimal :advance_amt , :precision => 8, :scale => 2
      t.string :payment_mode
      t.references :customer, foreign_key: true
      t.references :store, foreign_key: true
      t.timestamps
    end
  end
end
