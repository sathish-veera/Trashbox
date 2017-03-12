class CreateAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :areas do |t|
    	t.string :area_name
    	t.string :pincode

      t.timestamps
    end
  end
end
