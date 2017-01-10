class CreateTrashRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :trash_requests do |t|
      t.string :tr_serial_no
      t.string :request_status
      t.date :trash_request_date
      t.datetime :request_generate_date
      t.decimal :total_amount

      t.timestamps
    end
  end
end
