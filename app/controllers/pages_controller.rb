class PagesController < ApplicationController
  def home
    @fidelity_programs = FidelityProgram.all
    authorize @fidelity_programs
  end
end
