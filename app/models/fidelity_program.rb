class FidelityProgram < ApplicationRecord
  belongs_to :user
  has_many :rewards, dependent: :destroy
  has_many :inscriptions, dependent: :destroy

  accepts_nested_attributes_for :rewards
end
