class Permiso < ApplicationRecord
  belongs_to :puerta
  belongs_to :usuario
  has_many :horarios
  has_many :diums

end
