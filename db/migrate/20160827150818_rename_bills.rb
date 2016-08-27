class RenameBills < ActiveRecord::Migration[5.0]
  def change
    rename_table :bills, :orders
    rename_column :repairs, :bill_id, :order_id
  end
end
