class ApplicationController < ActionController::Base
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_kana, :last_kana ,:birthday,])
  end
end
