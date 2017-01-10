class CreateAddressDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :address_details do |t|
      t.integer :addressable_id
      t.string :addressable_type
      t.string :first_name
      t.string :last_name
      t.string :mobile_no
      t.string :land_line_no
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.integer :zip_code
      t.timestamps
    end
    add_index :address_details, [:addressable_id, :addressable_type]

  end
end
