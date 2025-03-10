class IncriptionReward < ApplicationRecord
  belongs_to :inscription
  belongs_to :reward
end
