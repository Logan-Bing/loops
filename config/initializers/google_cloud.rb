require "tempfile"
require "base64"

if ENV["GOOGLE_CLOUD_KEY"]
  file = Tempfile.new(["gcp-key", ".json"], encoding: 'utf-8')
  json_content = Base64.decode64(ENV["GOOGLE_CLOUD_KEY"]).force_encoding("UTF-8")

  file.write(json_content)
  file.flush
  file.rewind

  ENV["GOOGLE_APPLICATION_CREDENTIALS"] = file.path
end
