class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :create_inscription, if: :is_customer?
  has_many :fidelity_programs

  def create_inscription(fidelity_program)
    Inscription.create(user: self, fidelity_program: fidelity_program)
  end

  def is_customer?
    self.role == "customer"
  end
end
