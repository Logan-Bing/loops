class InscriptionReward < ApplicationRecord
  belongs_to :inscription
  belongs_to :reward
end
