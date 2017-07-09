class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :nombre,       limit: 105
      t.string :apellido_p,       limit: 105
      t.string :apellido_m,       limit: 105
      t.string :RFC,       limit: 15
      t.integer :active

      t.timestamps null: false
    end
  end
end
