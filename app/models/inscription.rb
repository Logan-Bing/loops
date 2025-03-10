class Inscription < ApplicationRecord
  belongs_to :user
  belongs_to :fidelity_program
end
