class InscriptionsController < ApplicationController

  def new
    @fidelity_program = FidelityProgram.find(params[:fidelity_program_id])
    @inscription = Inscription.new
    @sum = 0
  end

  def create
    @inscription = Inscription.new(set_params)
    @inscription.user_id = current_user.id
    @inscription.fidelity_program_id = params[:fidelity_program_id]
    @inscription.created = DateTime.now.strftime "%d/%m/%Y %H:%M"
    if @inscription.save
      redirect_to fidelity_program_inscription_path(@inscription)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @fidelity_program = FidelityProgram.find(params[:fidelity_program_id])
    @inscription = Inscription.find(params[:id])
    @sum = 0
  end

  def status
    @fidelity_program = FidelityProgram.find(params[:fidelity_program_id])
    @inscription = Inscription.find(params[:id])
  end

  private

  def set_params
    params.require(:inscription).require(:inscription_id, :fidelity_program_id)
  end
end
