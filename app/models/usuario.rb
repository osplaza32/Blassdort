class Usuario < ApplicationRecord
  include ActiveModel::SecurePassword
  has_secure_password

  validates_format_of :email, with:  /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/,message: "Error con el formato del email"
  validates :nombre, presence: true
  validates :email, presence: true
  validates :nombre, length: { minimum: 2 }
  validates :email, length: { minimum: 4 }
  validates :ntarjeta, length: { is: 26 }
  validates :telefono, length: { minimum: 6 }







  belongs_to :empresa
  has_many :permisos

end
