class BalanceAmountToOrders < ActiveRecord::Migration[5.2]
  def change
  	add_column :orders, :balance_amount, :decimal, :precision => 8, :scale => 2
  end
end
