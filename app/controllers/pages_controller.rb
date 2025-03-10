class PagesController < ApplicationController
  def home
    @fidelity_programs = policy_scope(FidelityProgram)
  end
end
