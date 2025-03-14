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

end
