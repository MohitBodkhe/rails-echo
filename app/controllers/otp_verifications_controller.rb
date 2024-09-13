class OtpVerificationsController < ApplicationController
  before_action :authenticate_user!

  def create
    if current_user.validate_and_consume_otp!(params[:otp_code], otp_secret: current_user.otp_secret)
      redirect_to root_path, notice: 'OTP verified successfully'
    else
      flash[:alert] = 'Invalid OTP code'
      render :new
    end
  end

  private

  def otp_params
    params.require(:otp_code)
  end
end
