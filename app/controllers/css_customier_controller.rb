class CssCustomierController < ApplicationController
  def index
  end

  def update
    css = ""
    css << "$color-success: #{params[:color_success]};" if params[:color_success].present?
    css << "$color-error: #{params[:color_error]};" if params[:color_error].present?
    logger.info css

    begin
      file = File.open(Rails.root.join("app/assets/stylesheets/custom.scss"), "w")
      file.write(css) 
    rescue e
      logger.info e
    ensure
      file.close unless file.nil?
    end

    redirect_to root_url
  end
end
