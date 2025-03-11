class FidelityProgram < ApplicationRecord
  belongs_to :user
  has_many :rewards, dependent: :destroy
  has_many :inscriptions, dependent: :destroy

  accepts_nested_attributes_for :rewards

  has_one_attached :qrcode, dependent: :destroy

end
