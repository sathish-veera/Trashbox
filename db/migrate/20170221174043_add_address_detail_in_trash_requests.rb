class AddAddressDetailInTrashRequests < ActiveRecord::Migration[5.0]
  def change
  	add_column :trash_requests, :address_detail_id, :integer
  end
end
