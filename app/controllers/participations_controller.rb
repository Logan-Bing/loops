class ParticipationsController < ApplicationController
  require 'date'

  def index
    @fidelity_program = FidelityProgram.find(params[:fidelity_program_id])
    @inscription = Inscription.find_by(fidelity_program_id: params[:fidelity_program_id])
  end

  def new
    @fidelity_program = FidelityProgram.find(params[:fidelity_program_id])
    @inscription = Inscription.find(params[:inscription_id])
    @sum = 0
    @participation = Participation.new
  end

  def redeem
    @fidelity_program = FidelityProgram.find(params[:fidelity_program_id])
    @inscription = current_user.inscriptions.find_by(fidelity_program_id: params[:fidelity_program_id])

    @participation = Participation.new
    @participation.inscription_id = @inscription.id
    @participation.points = params[:points]
    @participation.created = DateTime.now.strftime "%d/%m/%Y %H:%M"
    @participation.points = -@participation.points

    if @participation.save
      redirect_to fidelity_program_inscription_path(@fidelity_program, @inscription)
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def set_params
    params.require(:participation).permit(:fidelity_program_id, :inscription_id, :reward_id, :points)
  end
end
