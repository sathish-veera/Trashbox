class CreateTrashRequestItems < ActiveRecord::Migration[5.0]
  def change
    create_table :trash_request_items do |t|
      t.integer :trash_request_id
      t.integer :item_id
      t.string :rough_unit
      t.decimal :rough_amount
      t.string :actual_unit
      t.decimal :autual_amount
      t.timestamps
    end
  end
end
