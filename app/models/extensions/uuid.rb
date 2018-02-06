module Extensions
  module UUID
    extend ActiveSupport::Concern

    included do
      # old rails versions
      #set_primary_key 'uuid'
      # later rails versions, untested:
      self.primary_key = 'uuid'

      before_create :generate_uuid

      def generate_uuid
        self.id = UUIDTools::UUID.random_create.to_s
      end
    end
  end
end