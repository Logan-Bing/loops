class ParticipationsController < ApplicationController
  require 'date'

  def new
    @fidelity_program = FidelityProgram.find(params[:fidelity_program_id])
    @inscription = Inscription.find(params[:inscription_id])
    @sum = 0
    @participation = Participation.new
  end

  def new_deduct
  end

  def create
    @fidelity_program = FidelityProgram.find(params[:fidelity_program_id])
    @inscription = Inscription.find(params[:inscription_id])

    @participation = Participation.new(set_params)
    @participation.inscription_id = params[:inscription_id]
    @participation.created = DateTime.now.strftime "%d/%m/%Y %H:%M"
    if params[:mode] == "deduct"
      @participation.points = -@participation.points
    end
    if @participation.save
      redirect_to status_profile_path(params[:fidelity_program_id], params[:inscription_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def redeem
    @fidelity_program = FidelityProgram.find(params[:fidelity_program_id])
    @inscription = Inscription.find(params[:inscription_id])

    @participation = Participation.new(set_params)
    @participation.inscription_id = params[:inscription_id]
    @participation.created = DateTime.now.strftime "%d/%m/%Y %H:%M"
    @participation.points = -@participation.points
    if @participation.save
      redirect_to status_profile_path(params[:fidelity_program_id], params[:inscription_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:participation).permit(:fidelity_program_id, :inscription_id, :points)
  end
end
