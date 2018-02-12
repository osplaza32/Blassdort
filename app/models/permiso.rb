class Permiso < ApplicationRecord
  belongs_to :puerta
  belongs_to :usuario

end
