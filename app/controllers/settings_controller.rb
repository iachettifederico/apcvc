class SettingsController < ApplicationController
  before_action :set_setting, only: [:show, :edit, :update, :destroy]

  def create
    @setting = Settings.new(setting_params)

    respond_to do |format|
      if @setting.save
        format.html { redirect_to :back, notice: 'Setting was successfully created.' }
        format.json { render action: 'show', status: :created, location: @setting }
      else
        format.html { redirect_to :back, alert: "There was a problem saving the '#{@setting.key}' setting." }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @setting.update(setting_params)
        format.html { redirect_to :back, notice: 'Setting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to :back, alert: "There was a problem saving the '#{@setting.key}' setting." }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @setting.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = Settings.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setting_params
      params[:settings].permit(:key, :value)
    end
end
