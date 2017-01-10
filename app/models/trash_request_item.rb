class TrashRequestItem < ApplicationRecord
  belongs_to :trash_request
  belongs_to :item
end
