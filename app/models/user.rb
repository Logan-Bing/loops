class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :fidelity_program
<<<<<<< HEAD
=======


  def create_inscription(fidelity_program)
    Inscription.create(user: self, fidelity_program: fidelity_program)
  end

  def is_customer?
    self.role == "customer"
  end
>>>>>>> 7109313c542900ec794663bf02ecd4e329ec7461
end
