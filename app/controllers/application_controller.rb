class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :authenticate_user! , except: [:search]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :tel_confirmation, :first_name, :last_name, :first_name_kana, :last_name_kana, :zip, :prefecture, :city, :block, :building, :phone_number, :card_number, :expiration_month, :expiration_year, :security_code, :profile, :birthday])
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "jojo5555"
    end
  end
end
