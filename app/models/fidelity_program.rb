class FidelityProgram < ApplicationRecord
  include Abyme::Model
  belongs_to :user
  has_many :rewards, dependent: :destroy
  has_many :inscriptions, dependent: :destroy
  accepts_nested_attributes_for :rewards
  has_one_attached :qrcode, dependent: :destroy
  abymize :rewards

  accepts_nested_attributes_for :rewards, allow_destroy: true

  has_one_attached :qrcode, dependent: :destroy

  before_commit :generate_qrcode, on: :create
  before_commit :remove_empty_reward, on: :create

  private

  def generate_qrcode
    # host = ENV['HOST']

    url = Rails.application.routes.url_helpers.fidelity_program_url(self.id)
    qrcode = RQRCode::QRCode.new(url)

    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120,
    )

    self.qrcode.attach(
      io: StringIO.new(png.to_s),
      filename: "qrcode.png",
      content_type: "image/png",
    )
  end

  def remove_empty_reward
    rewards.each do |reward|
      reward.destroy if reward.description.blank?
    end
  end
end
