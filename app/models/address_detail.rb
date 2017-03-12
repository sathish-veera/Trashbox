class AddressDetail < ApplicationRecord
  belongs_to :address_detail, polymorphic: true    
  belongs_to :area
end
