class Puerta < ApplicationRecord
  belongs_to :empresa
  has_one :hardware
  has_many :permisos
end
