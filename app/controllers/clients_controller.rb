class ClientsController < ApplicationController
  respond_to :json
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
     render json: Client.where(active:true)
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json 
  def create
    @id = client_params[:id].to_i
    @message = ''

      if @id.nil? || @id == 0
          @client = Client.new(client_params)
      else
        @client = Client.find_by_id(@id)
      end

      if @client.valid?
        if @client.id == 0 || @client.id.nil? 
          @client.save()
        else
          @client.update(client_params)
        end
      else
        @message = @client.errors.messages
      end

      render json:{client: @client, message: @message}
  end


 def search_client_name
    search = params[:s]
    render json: Client.where("nombre LIKE ? OR apellido_p LIKE ? OR apellido_m LIKE ?" , "%#{search}%","%#{search}%","%#{search}%")
  end

 def lastclient
  render json: Client.last
end
def edit_client
  render json: Client.find(params[:client_id])
end

  private
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:id,:nombre, :apellido_p, :apellido_m, :RFC, :active)
    end
end
