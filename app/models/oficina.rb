class Oficina < ActiveRecord::Base
  include Extensions::UUID

  belongs_to :empresa

end
