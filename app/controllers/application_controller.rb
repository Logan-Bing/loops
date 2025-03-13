class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({ roles: ["merchant", "customer"] }, :email, :password, :password_confirmation)
    end
  end

  private

  def after_sign_in_path_for(resource_or_scope)
    current_user.create_inscription(FidelityProgram.find(params[:fidelity_program_id])) if params[:fidelity_program_id]
    return "/pages/home"
  end
end
