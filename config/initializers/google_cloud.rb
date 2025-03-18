require "tempfile"
require "base64"

if ENV["GOOGLE_CLOUD_KEY"]
  file = Tempfile.new(["gcp-key", ".json"])

  # Décoder le JSON depuis la variable Base64
  file.write(Base64.decode64(ENV["GOOGLE_CLOUD_KEY"]))
  file.rewind

  ENV["GOOGLE_APPLICATION_CREDENTIALS"] = file.path
end
