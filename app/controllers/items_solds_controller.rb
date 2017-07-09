class ItemsSoldsController < ApplicationController
  before_action :set_items_sold, only: [:show, :edit, :update, :destroy]

  # GET /items_solds
  # GET /items_solds.json
  def index
    @items_solds = ItemsSold.all
  end

  # GET /items_solds/1
  # GET /items_solds/1.json
  def show
  end

  # GET /items_solds/new
  def new
    @items_sold = ItemsSold.new
  end

  # GET /items_solds/1/edit
  def edit
  end

  # POST /items_solds
  # POST /items_solds.json
  def create
    @items_sold = ItemsSold.new(items_sold_params)

    respond_to do |format|
      if @items_sold.save
        format.html { redirect_to @items_sold, notice: 'Items sold was successfully created.' }
        format.json { render :show, status: :created, location: @items_sold }
      else
        format.html { render :new }
        format.json { render json: @items_sold.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items_solds/1
  # PATCH/PUT /items_solds/1.json
  def update
    respond_to do |format|
      if @items_sold.update(items_sold_params)
        format.html { redirect_to @items_sold, notice: 'Items sold was successfully updated.' }
        format.json { render :show, status: :ok, location: @items_sold }
      else
        format.html { render :edit }
        format.json { render json: @items_sold.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items_solds/1
  # DELETE /items_solds/1.json
  def destroy
    @items_sold.destroy
    respond_to do |format|
      format.html { redirect_to items_solds_url, notice: 'Items sold was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_items_sold
      @items_sold = ItemsSold.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def items_sold_params
      params.require(:items_sold).permit(:id_sale, :cantidad)
    end
end
