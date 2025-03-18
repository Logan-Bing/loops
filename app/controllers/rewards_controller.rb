class RewardsController < ApplicationController
  before_action :find_fidelity_program, only: [:create, :update, :destroy, :edit, :show]

  def index
    @rewards = Reward.where(fidelity_program_id: params[:fidelity_program_id])
    @inscription = Inscription.find_by(fidelity_program_id: params[:fidelity_program_id])
    @fidelity_program = FidelityProgram.find(params[:fidelity_program_id])
  end

  def show
    @reward = Reward.find(params[:id])
    @inscription = current_user.inscriptions.find_by(fidelity_program_id: params[:fidelity_program_id])
    @fidelity_program = FidelityProgram.find(params[:fidelity_program_id])
  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(set_params)
    @reward.fidelity_program = @fidelity_program

    if @reward.save
      redirect_to new_fidelity_program
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @reward.destroy
    redirect_to fidelity_program_path(@fidelity_program)
  end

  def edit
    @reward = Reward.find(params[:id])
  end

  def update
    @reward = Reward.update(set_params)
    if @reward.save
      redirect_to fidelity_program_path(@fidelity_program)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_fidelity_program
    @fidelity_program = FidelityProgram.find(params[:fidelity_program_id])
  end

  def set_params
    params.require(:reward).permit(:fidelity_program_id, :name, :description, :points_required)
  end
end
