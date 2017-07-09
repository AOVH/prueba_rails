class ItemsController < ApplicationController
    respond_to :json
  before_action :set_item, only: [:show, :edit, :update, :destroy]


  # GET /items
  # GET /items.json
  def index
   render json: Item.where(active:true)
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
   @id = item_params[:id]
    @message = ''

      if @id.nil? || @id == 0
          @item = Item.new(item_params)
      else
        @item = Item.find_by_id(@id)
      end

      if @item.valid?
        if @item.id == 0 || @item.id.nil? 
          @item.save()
        else
          @item.update(item_params)
        end
      else
        @message = @item.errors.messages
      end

      render json:{item: @item, message: @message}
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
   def search_item_name
    search = params[:s]
    render json: Item.where("descripcion LIKE ? OR modelo LIKE ?" , "%#{search}%","%#{search}%")
  end
   def lastitem
  render json: Item.last
end
def edit_item
  render json: Item.find(params[:item_id])
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:id,:descripcion, :modelo, :precio, :existencia,:active)
    end
end
