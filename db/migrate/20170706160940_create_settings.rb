class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :tasa_financiamiento
      t.integer :porcentaje_enganche
      t.date :plazo_maximo
      t.integer :active

      t.timestamps null: false
    end
  end
end
