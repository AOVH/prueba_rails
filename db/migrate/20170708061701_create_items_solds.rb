class CreateItemsSolds < ActiveRecord::Migration
  def change
    create_table :items_solds do |t|
      t.integer :id_sale
      t.integer :cantidad

      t.timestamps null: false
    end
  end
end
