class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    all=Sale.where(active:true)
    ventas= resumen all 

    render json:ventas
  end 

  # GET /sales/1
  # GET /sales/1.json 
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end
 
  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create

    @sale = Sale.new(sale_params)
    @message=''
    
      if @sale.save
        articulos= params[:sale][:articulos_vendidos]

        articulos.each do |articulo|
          inventario= Item.find(articulo[:id_item])
          inventario.existencia = inventario.existencia - articulo[:item_cantidad]
          inventario.save()  
          end   


              
         articulos.each do |articulo|
          sold = ItemsSold.new(items_solds_params)
          ultima_venta= Sale.last
          sold.id_sale=ultima_venta.id
          sold.cantidad=articulo[:item_cantidad]
          sold.save()
       
          end   
        else
           @message='error'
        end    
      

         render json:{sale: @sale, message: @message}
    
  end
 
  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def lastsale
  render json: Sale.last
  end


    def resumen ventas
     response=[]
     
     ventas.each do |venta|
     
      ven={}     
      cliete = Client.find(venta.id_client) 
      ven[:folio_venta]=venta.id 
      ven[:clave_cliente]=venta.id_client
      ven[:nombre_completo]= cliete.nombre+" "+cliete.apellido_p+" "+cliete.apellido_m 
      ven[:total]=venta.total_venta  
      ven[:fecha_venta]=venta.fecha_venta
      ven[:estatus]=venta.estatus   

      
      response.push(ven)
      
    end
    response
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:id_client, :id_financing_models, :id_financing_types, :id_paid_systems, :cantidad_pagos, :fecha_venta, :estatus,:total_venta,:pago_diferido, :active)
    end
    def items_solds_params
      params.require(:sale).permit(:id_sale, :cantidad)
    end
end
