class CreatePaidSystems < ActiveRecord::Migration
  def change
    create_table :paid_systems do |t|
    	 t.string :descripcion

      t.timestamps null: false
    end
  end
end
