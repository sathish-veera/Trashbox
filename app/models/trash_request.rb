class TrashRequest < ApplicationRecord
 belongs_to :user
 has_one :address_detail, as: :addressable
 has_many :trash_request_items
end
