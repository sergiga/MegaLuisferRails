class CreatePhoneBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :phone_brands do |t|
      t.string :brand, unique: true, null: false

      t.timestamps
    end
  end
end
