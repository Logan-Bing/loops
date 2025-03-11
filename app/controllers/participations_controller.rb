class ParticipationsController < ApplicationController
  def new
    @inscription = Inscription.find(params[:inscription_id])
    @participation = Inscription.new
  end

  def create
    @participation = Inscription.new(set_params)
    @participation.inscription_id = params[:inscription_id]
    if @participation.save
      redirect_to fidelity_program_inscription_path(params[:inscription_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:participation).require(:inscription_id, :point)
  end
end
