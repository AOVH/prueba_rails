class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :id_client      
      t.integer :id_financing_models
      t.integer :id_financing_types
      t.integer :id_paid_systems
      t.integer :cantidad_pagos
      t.date :fecha_venta
      t.string :estatus
      t.integer :active

      t.timestamps null: false
    end
  end
end
