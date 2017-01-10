class AddressDetail < ApplicationRecord
  belongs_to :address_detail, polymorphic: true    

end
