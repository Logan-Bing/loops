require "google/cloud/vision"
require 'dotenv/load'
require 'date'

class ParticipationsController < ApplicationController
  def show
    @fidelity_program = FidelityProgram.find(params[:fidelity_program_id])
    @inscription = current_user.inscriptions.find_by(fidelity_program_id: params[:fidelity_program_id])
    @participation = Participation.find(params[:id])

    qrcode_url = "#{request.protocol}#{request.host}#{fidelity_program_inscription_participation_path}?id=#{params[:id]}"
    @qrcode = RQRCode::QRCode.new(qrcode_url)
    @svg = @qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 3,
      standalone: true,
      use_path: true
    )
  end

  def new
    @fidelity_program = FidelityProgram.find(params[:fidelity_program_id])
    @inscription = Inscription.find(params[:inscription_id])
    @sum = 0
    @participation = Participation.new
  end

  def create
    @inscription = Inscription.find(params[:inscription_id])
    @fidelity_program = FidelityProgram.find(params[:fidelity_program_id])
    @participation = Participation.new(set_photo)
    @participation.inscription = @inscription
    @participation.inscription.fidelity_program = @fidelity_program
    @participation.points = 0
    @participation.save!
    @participation.created = DateTime.now.strftime "%d/%m/%Y %H:%M"
    resultAPI = vision_check(@participation.photo)

    if resultAPI
      @participation.update(points: resultAPI)
      redirect_to customers_scans_path(@fidelity_program, @participation)
    else
      render :new, status: :unprocessable_entity
    end
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
      # redirect_to fidelity_program_inscription_path(@fidelity_program, @inscription)
      redirect_to fidelity_program_inscription_participation_path(@fidelity_program, @inscription, @participation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def vision_check(image)

    # Instanciez le client de l'API
    vision = Google::Cloud::Vision.image_annotator

    # Remplacez "chemin/vers/image_de_test.jpg" par le chemin réel de l'image de test
    image_path = url_for(image)

    # Effectuez la détection de texte
    response = vision.text_detection image: image_path

    # Vérifiez s'il y a une erreur dans la réponse
    if response.responses.first.error
      puts "Erreur : #{response.responses.first.error.message}"
    else
      # Récupérez et affichez le texte détecté
      text_annotations = response.responses.first.text_annotations
      if text_annotations.any?
        complete_text = text_annotations.first.description
        if match = complete_text.match(/TOTAL\s*[:\-]?\s*(?:CHF\s*)?(\d+(?:[.,]\d{2})?)/i)
          return match[1].to_i
        else
          puts "Aucun texte correspondant à la regex n'a été trouvé."
          return false
        end
      else
        puts "Aucun texte détecté."
        return false
      end
    end
  end


  def set_params
    params.require(:participation).permit(:fidelity_program_id, :inscription_id, :reward_id, :points)
  end

  def set_photo
    params.require(:participation).permit(:fidelity_program_id, :inscription_id,:points, :photo)
  end
end
