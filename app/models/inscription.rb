class Inscription < ApplicationRecord
  belongs_to :user
  belongs_to :fidelity_program
  has_many :participations, dependent: :destroy
end
