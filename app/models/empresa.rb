class Empresa < ActiveRecord::Base
  include Extensions::UUID
  has_many :oficinas


end
