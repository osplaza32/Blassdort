class Usuario < ApplicationRecord
  include ActiveModel::SecurePassword
  has_secure_password
  validates_format_of :telefono, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/ ,message: "error el marcado del telefono"
  validates_format_of :email, with:  /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/,message: "Error con el formato del email"

  belongs_to :empresa
  has_many :permisos

end
