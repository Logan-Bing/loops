require "google/cloud/vision"
require 'dotenv/load'


# Instanciez le client de l'API
vision = Google::Cloud::Vision.image_annotator

# Remplacez "chemin/vers/image_de_test.jpg" par le chemin réel de l'image de test
image_path = "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/ReceiptSwiss.jpg/400px-ReceiptSwiss.jpg"

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
      total_price = match[1].to_i
      puts total_price
    else
      puts "Aucun texte correspondant à la regex n'a été trouvé."
    end
  else
    puts "Aucun texte détecté."
  end
end
