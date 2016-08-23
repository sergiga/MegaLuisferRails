class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :cif_dni, unique: true, null: false
      t.string :name, null: false
      t.string :address
      t.string :contact_phone

      t.timestamps
    end

    create_table :bills do |t|
      t.belongs_to :client, index: true
      t.float :price

      t.timestamps
    end

    create_table :repairs do |t|
      t.belongs_to :bill, index: true
      t.integer :status, default: 0
      t.text :description

      t.timestamps
    end
  end
end
