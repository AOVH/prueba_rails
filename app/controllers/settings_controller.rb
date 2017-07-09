class SettingsController < ApplicationController
    respond_to :json
  before_action :set_setting, only: [:show, :edit, :update, :destroy]


  # GET /settings
  # GET /settings.json
  def index
    render json: Setting.last  
  end

  # GET /settings/1
  # GET /settings/1.json
  def show
  end

  # GET /settings/new
  def new
    @setting = Setting.new
  end

  # GET /settings/1/edit
  def edit
  end

  # POST /settings
  # POST /settings.json
  def create
      @first =Setting.last
      @message = ''
     
      if @first.nil? 
          @setting = Setting.new(setting_params)
      else
        @setting = @first
      end

      if @setting.valid?
        if @first.nil? 
          @setting.save()
        else
          @setting.update(setting_params)
        end
      else
        @message = @setting.errors.messages
      end

      render json:{setting: @setting, message: @message}

  end

  # PATCH/PUT /settings/1
  # PATCH/PUT /settings/1.json
  def update
    respond_to do |format|
      if @setting.update(setting_params)
        format.html { redirect_to @setting, notice: 'Setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @setting }
      else
        format.html { render :edit }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /settings/1
  # DELETE /settings/1.json
  def destroy
    @setting.destroy
    respond_to do |format|
      format.html { redirect_to settings_url, notice: 'Setting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = Setting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setting_params
      params.require(:setting).permit(:tasa_financiamiento, :porcentaje_enganche, :plazo_maximo, :active)
    end
end
