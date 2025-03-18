return if Rails.env.production? && ENV["GOOGLE_CREDENTIALS"].blank?

require "google/cloud/vision"

if ENV["GOOGLE_CREDENTIALS"]
  credentials_json = Base64.decode64(ENV["GOOGLE_CREDENTIALS"])
  credentials = JSON.parse(credentials_json)

  vision = Google::Cloud::Vision.image_annotator do |config|
    config.credentials = credentials_json
  end

  Rails.application.config.google_vision_client = vision
end
