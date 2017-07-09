json.extract! item, :id, :descripcion, :modelo, :precio, :existencia, :created_at, :updated_at
json.url item_url(item, format: :json)
