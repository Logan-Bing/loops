class ApplicationController < ActionController::Base

  before_action :authenticate_user!




  private


  def after_sign_in_path_for(resource_or_scope)
    current_user.create_inscription(FidelityProgram.find(params[:fidelity_program_id])) if params[:fidelity_program_id]
  end
end
