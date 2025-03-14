class ApplicationController < ActionController::Base


  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  private

  def after_sign_up_path_for(resource_or_scope)
    current_user.create_inscription(FidelityProgram.find(params[:fidelity_program_id])) if params[:fidelity_program_id]
    return "/pages/home"
  end
end
