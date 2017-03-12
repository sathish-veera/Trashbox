class AddAreaInAddressDetails < ActiveRecord::Migration[5.0]
  def change
  	add_column :address_details, :area_id, :integer
  	add_column :address_details, :landmark, :string
  end
end
