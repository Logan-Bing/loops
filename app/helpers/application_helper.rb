module ApplicationHelper
  def fidelity_programs_exist?
    FidelityProgram.exists?
  end
end
