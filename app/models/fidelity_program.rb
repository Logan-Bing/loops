class FidelityProgram < ApplicationRecord
  include Abyme::Model
  
  belongs_to :user
  has_many :rewards, dependent: :destroy
  has_many :inscriptions, dependent: :destroy
  accepts_nested_attributes_for :rewards
  has_one_attached :qrcode, dependent: :destroy
  abymize :rewards

  accepts_nested_attributes_for :rewards, allow_destroy: true

  before_commit :remove_empty_reward, on: :create

  private

  def remove_empty_reward
    rewards.each do |reward|
      reward.destroy if reward.description.blank?
    end
  end
end
