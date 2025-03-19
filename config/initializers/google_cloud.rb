require "base64"
require "fileutils"

if ENV["GOOGLE_CLOUD_KEY"]
  file_path = Rails.root.join("lib", "gcp-key.json")

  # S'assure que le dossier tmp existe
  FileUtils.mkdir_p(File.dirname(file_path))

  # Écrit les credentials décodés dans un fichier JSON permanent
  File.write(file_path, ENV["GOOGLE_CLOUD_KEY"] )

  # Définit la variable d'environnement avec le chemin permanent
  ENV["GOOGLE_APPLICATION_CREDENTIALS"] = file_path.to_s
end
