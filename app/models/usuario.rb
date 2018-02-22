class Usuario < ApplicationRecord
  include ActiveModel::SecurePassword
  has_secure_password
  validates :email, uniqueness: true

  validates :nombre, presence: true
  validates :email, presence: true
  validates :nombre, length: { minimum: 2 }
  validates :email, length: { minimum: 4 }
  validates :ntarjeta, length: { is: 26 }
  validates :telefono, length: { minimum: 6 }







  belongs_to :empresa
  has_many :permisos

end
