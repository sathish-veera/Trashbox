json.extract! item, :id, :item_code, :item_name, :unit_price, :created_at, :updated_at
json.url item_url(item, format: :json)