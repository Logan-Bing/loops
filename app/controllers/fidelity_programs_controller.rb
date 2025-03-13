class FidelityProgramsController < ApplicationController
  before_action :find_id, only:[:edit, :show, :update, :destroy]

  def nav
    @fidelity_programs = FidelityProgram.all
  end

  def index
    @fidelity_programs = FidelityProgram.all
  end

  def new
    @fidelity_programs = FidelityProgram.all
    @fidelity_program = FidelityProgram.new
    @fidelity_program.rewards.build
  end

  def create
    @fidelity_program = FidelityProgram.new(set_params)
    @fidelity_program.user = current_user
    @fidelity_program.created = DateTime.now.strftime "%d/%m/%Y %H:%M"
    @fidelity_program.active = true
    
    if params[:rewards_attributes]
      @fidelity_program.rewards.build
      format.html { render :new, status: :unprocessable_entity }
    end

    respond_to do |format|
      if params[:rewards_attributes]
        @fidelity_program.rewards.build
        format.html { render :new, status: :unprocessable_entity }
        @fidelity_program.save
      else
        if @fidelity_program.save
          format.html { redirect_to @fidelity_program }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
    @fidelity_program.save!
  end

  def show
    qrcode_url = "#{request.protocol}#{request.host}#{new_user_registration_path}?id=#{params[:id]}"
    @qrcode = RQRCode::QRCode.new(qrcode_url)
    @svg = @qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 3,
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
    params.require(:fidelity_program).permit(:name, :points_per_euro, :qrcode, rewards_attributes: [:id, :name, :description, :points_required, :_destroy])
  end

  def find_id
    @fidelity_program = FidelityProgram.find(params[:id])
  end

end
