class PagesController < ApplicationController
  def home
    @fidelity_program = current_user.fidelity_program
  end

  def etablissement
  end

  def settings
  end

  def performances
  end

  # ---------------CUSTOMER PAGES----------------------

  def customers_rewards
  end

  def customers_scans
    @fidelity_program = FidelityProgram.find(params[:fidelity_program_id])
    @inscription = current_user.inscriptions.find_by(fidelity_program_id: params[:fidelity_program_id]) 
  end

  def customers_etablissement
  end

end
