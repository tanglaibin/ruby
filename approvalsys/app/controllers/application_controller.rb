class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout "common"
  include ErrorHandlers
  include CheckPermission

  #ユーザー処理
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :role_id]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
