class FidelityProgramsController < ApplicationController
  before_action :find_id, only:[:edit, :show, :update, :destroy]

  def index
    @fidelity_programs = FidelityProgram.all
  end

  def new
    @fidelity_program = FidelityProgram.new
    @fidelity_program.rewards.build
  end

  def create
    @fidelity_program = FidelityProgram.new(set_params)
    @fidelity_program.user_id = current_user.id
    if @fidelity_program.save
      redirect_to fidelity_program_path(@fidelity_program)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    qrcode_url = "#{request.protocol}#{request.host}#{fidelity_program_path(@fidelity_program)}"
    @qrcode = RQRCode::QRCode.new(qrcode_url)
    @svg = @qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 11,
      standalone: true,
      use_path: true
    )
  end

  def edit
  end

  def update

    if @fidelity_program.update(set_params)
      redirect_to fidelity_path(@fidelity_program)
    else
      render :new,status: :unprocessable_entity
    end
  end

  def destroy
    @fidelity_program.destroy
    redirect_to root_path, status: :see_other
  end

  def show_clients
    @fidelity_programs = FidelityProgram.all
  end

  private

  def set_params

    params.require(:fidelity_program).permit(:name, :points_per_euro, :qrcode, rewards: [:id, :name, :description, :points_required])
  end

  def find_id
    @fidelity_program = FidelityProgram.find(params[:id])
  end
end
