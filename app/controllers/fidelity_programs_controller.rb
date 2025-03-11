class FidelityProgramsController < ApplicationController
  before_action :find_id, only:[:edit, :show, :update, :destroy]

  def index
    @fidelity_programs = policy_scope(FidelityProgram)
    @fidelity_programs = FidelityProgram.all
  end

  def new
    @fidelity_program = FidelityProgram.new
    authorize @fidelity_program
  end

  def create
    @fidelity_program = @fidelity_program.new(set_params)
    @fidelity_program.user_id = current_user.id
    authorize @fidelity_program
    if @fidelity_program.save
      redirect_to fidelity_path(@fidelity_program)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    authorize @fidelity_program
  end

  def update
    authorize @fidelity_program
    if @fidelity_program.update(set_params)
      redirect_to fidelity_path(@fidelity_program)
    else
      render :new,status: :unprocessable_entity
    end
  end

  def destroy
    authorize @fidelity_program
    @fidelity_program.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_params
    params.require(:fidelity_program).permit(:name, :points_per_euro)
  end

  def find_id
    @fidelity_program = FidelityProgram.find(params[:id])
  end
end
