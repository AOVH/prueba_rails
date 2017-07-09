class CreateFinancingModels < ActiveRecord::Migration
  def change
    create_table :financing_models do |t|
    	 t.string :descripcion    	 

      t.timestamps null: false
    end
  end
end
