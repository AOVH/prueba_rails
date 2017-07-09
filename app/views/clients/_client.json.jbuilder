json.extract! client, :id, :nombre, :apellido_p, :apellido_m, :RFC, :created_at, :updated_at
json.url client_url(client, format: :json)
