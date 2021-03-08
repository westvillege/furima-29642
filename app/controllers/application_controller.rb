class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in,
                                      keys: [:name, :family_name, :first_name, :family_name_furi, :first_name_furi, :birthday])
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:name, :family_name, :first_name, :family_name_furi, :first_name_furi, :birthday])
    devise_parameter_sanitizer.permit(:accout_update,
                                      keys: [:name, :family_name, :first_name, :family_name_furi, :first_name_furi, :birthday])
  end
end
