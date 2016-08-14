class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.integer :bill_id
      t.string :cif_dni, unique: true, null: false
      t.string :name, null: false
      t.string :address
      t.string :contact_phone

      t.timestamps
    end

    create_table :bills do |t|
      t.integer :client_id
      t.integer :repair_id
      t.float :price

      t.timestamps
    end

    create_table :repairs do |t|
      t.integer :bill_id
      t.integer :status, default: 0
      t.text :description

      t.timestamps
    end

    add_index :clients, :bill_id
    add_index :bills, :client_id
    add_index :bills, :repair_id
    add_index :repairs, :bill_id
  end
end
