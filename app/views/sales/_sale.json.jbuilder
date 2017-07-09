json.extract! sale, :id, :id_client, :id_item, :id_financing_models, :id_financing_types, :id_paid_system, :cantidad_pagos, :fecha_venta, :estatus, :active, :created_at, :updated_at
json.url sale_url(sale, format: :json)
