require "tempfile"
if ENV["GOOGLE_CLOUD_KEY"]
  file = Tempfile.new(["gcp-key", ".json"])
  file.write(ENV["GOOGLE_CLOUD_KEY"])
  file.rewind
  ENV["GOOGLE_APPLICATION_CREDENTIALS"] = file.path
