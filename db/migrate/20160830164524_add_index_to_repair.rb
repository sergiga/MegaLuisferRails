class AddIndexToRepair < ActiveRecord::Migration[5.0]
  def change
    add_reference :repairs, :phone, index: true, foreign_key: true
  end
end
