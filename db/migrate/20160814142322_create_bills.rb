class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :surname
      t.string :email
      t.string :telephone, null: false

      t.timestamps
    end

    create_table :bills do |t|
      t.integer :client_id
      t.float :total_price

      t.timestamps
    end

    create_table :repairs do |t|
      t.integer :bill_id
      t.integer :status, default: 0
      t.integer :incidence
      t.text :description

      t.timestamps
    end

    add_index :bills, :client_id
    add_index :repairs, :bill_id
  end
end
