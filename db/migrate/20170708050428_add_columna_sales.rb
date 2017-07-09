class AddColumnaSales < ActiveRecord::Migration
  def change
  	add_column :sales, :pago_diferido, :decimal, :precision => 8, :scale => 2
  	add_column :sales, :total_venta, :decimal, :precision => 8, :scale => 2
  end
end
