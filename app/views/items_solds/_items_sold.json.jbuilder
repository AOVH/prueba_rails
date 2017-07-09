json.extract! items_sold, :id, :id_sale, :cantidad, :created_at, :updated_at
json.url items_sold_url(items_sold, format: :json)
