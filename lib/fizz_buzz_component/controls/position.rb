module FizzBuzzComponent
  module Controls
    module Position
      def self.example
        Messaging::Controls::Metadata.position
      end

      module Initial
        def self.example
          0
        end
      end

      module Global
        def self.example
          Messaging::Controls::Metadata.global_position
        end
      end
    end
  end
end
