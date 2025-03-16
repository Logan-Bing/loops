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
  end

  def customers_etablissement
  end

end
