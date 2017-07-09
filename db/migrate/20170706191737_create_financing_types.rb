class CreateFinancingTypes < ActiveRecord::Migration
  def change
    create_table :financing_types do |t|
    	t.string :descripcion 
    	t.integer :dias  	

      t.timestamps null: false
    end
  end
end
