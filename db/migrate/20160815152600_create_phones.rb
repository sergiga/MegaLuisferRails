class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.belongs_to :phone_brand, index: true
      t.string :model
      t.string :model_review

      t.timestamps
    end
  end
end
