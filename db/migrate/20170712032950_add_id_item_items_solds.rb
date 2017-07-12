class AddIdItemItemsSolds < ActiveRecord::Migration
  def change
  	add_column :items_solds, :id_item, :integer
  end
end
