class CreateComponents < ActiveRecord::Migration[5.0]
  def change
    create_table :components do |t|
    	t.belongs_to :component_desc, index: true
    	t.integer :status

      t.timestamps
    end
  end
end
