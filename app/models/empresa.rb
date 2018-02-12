class Empresa < ApplicationRecord
  has_many :usuarios
  has_many :puertas

end
