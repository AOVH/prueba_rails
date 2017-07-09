class Sale < ActiveRecord::Base
	 belongs_to :client

	 def self.actualizar_articulos articulos
   		 articulos.each do |articulo|
          inventario= Item.find(articulo[:id_item])
          inventario.existencia = inventario.existencia - articulo[:item_cantidad]
          inventario.save()  
          end   
  	end

  def self.items_solds articulos
       articulos.each do |articulo|
        sold = Sale.new(items_solds_params)
        ultima_venta= Sale.last
        sold.id_sale=ultima_venta.id
        sold.cantidad=articulo[:cantidad]
        sold.save()
     
      	end

    
  end
  
end
 