class CreateComponentDescs < ActiveRecord::Migration[5.0]
  def change
    create_table :component_descs do |t|
    	t.integer :componentType
    	t.string :brand
    	t.string :model
    	t.text :features
    	t.integer :alert, default: 0

      t.timestamps
    end
  end
end
