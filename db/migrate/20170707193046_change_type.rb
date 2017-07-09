class ChangeType < ActiveRecord::Migration
  def change
  	change_table :settings do |t|
      t.change :tasa_financiamiento, :decimal,:precision => 8, :scale => 2
      t.change :porcentaje_enganche, :decimal,:precision => 4, :scale => 2
      t.change :plazo_maximo, :decimal,:precision => 8, :scale => 2
    end
  end
end
