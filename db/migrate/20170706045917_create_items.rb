class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :descripcion,       limit: 500
      t.string :modelo,       limit: 200
      t.decimal :precio, :precision => 8, :scale => 2
      t.integer :existencia
      t.integer :active

      t.timestamps null: false
    end
  end
end
