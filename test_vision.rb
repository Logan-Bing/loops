require "google/cloud/vision"
require 'dotenv/load'


# Instanciez le client de l'API
vision = Google::Cloud::Vision.image_annotator

# Remplacez "chemin/vers/image_de_test.jpg" par le chemin réel de l'image de test
image_path = "ReceiptSwiss.jpg"

# Effectuez la détection de texte
response = vision.text_detection image: image_path

# Vérifiez s'il y a une erreur dans la réponse
if response.responses.first.error
  puts "Erreur : #{response.responses.first.error.message}"
else
  # Récupérez et affichez le texte détecté
  text_annotations = response.responses.first.text_annotations
  if text_annotations.any?
    puts "Texte détecté :"
    puts text_annotations.first.description
  else
    puts "Aucun texte détecté."
  end
end
