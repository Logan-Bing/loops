class Participation < ApplicationRecord
  belongs_to :inscription
  has_one_attached :photo
end
