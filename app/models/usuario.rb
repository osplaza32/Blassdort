class Usuario < ApplicationRecord
  include ActiveModel::SecurePassword
  has_secure_password
  belongs_to :empresa
  has_many :permisos

end
