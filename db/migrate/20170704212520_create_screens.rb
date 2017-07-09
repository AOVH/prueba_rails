class CreateScreens < ActiveRecord::Migration
  def change
    create_table :screens do |t|
      t.string :nombre
      t.string :link
      t.integer :modulo_id

      t.timestamps null: false
    end
  end
end
