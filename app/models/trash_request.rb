class TrashRequest < ApplicationRecord
 #belongs_to :user
 has_one :address_detail, as: :addressable
 has_many :trash_request_items

  def self.create_record(params)
    trash_request = self.new(tr_serial_no: self.generate_serial_no,request_status: "New",trash_request_date: params[:trash_request_date],request_generate_date: Time.now )
    trash_request.save!
    for item in params[:trash_request_items]
     if  params[:trash_request_items][item][:is_checked] == "1"
      trash_request_item = TrashRequestItem.new(trash_request_id: trash_request.id, rough_unit: params[:trash_request_items][item][:rough_unit],item_id: item, rough_amount: params[:trash_request_items][item][:rough_amount])
      trash_request_item.save!
    end
    end
  end

 def self.update_record(params,id)
   trash_request = self.find_by_id(id)
   trash_request.update_attributes(trash_request_date: params[:trash_request_date])
   for item in params[:trash_request_items]
     if  params[:trash_request_items][item][:is_checked] == "1"
       trash_request_item = TrashRequestItem.where(trash_request_id: trash_request.id, item_id: item).first
       if trash_request_item
        trash_request_item.update_attributes(rough_unit: params[:trash_request_items][item][:rough_unit])
       else
         trash_request_item = TrashRequestItem.new(trash_request_id: trash_request.id, rough_unit: params[:trash_request_items][item][:rough_unit],item_id: item, rough_amount: params[:trash_request_items][item][:rough_amount])
         trash_request_item.save!
       end
     else
       trash_request_item = TrashRequestItem.where(trash_request_id: trash_request.id, item_id: item).first
       trash_request_item.destroy if trash_request_item
     end
   end
 end
  def self.generate_serial_no
    char = "TR"
    char + (self.last.id + 1).to_s rescue "TR1"
  end
end
