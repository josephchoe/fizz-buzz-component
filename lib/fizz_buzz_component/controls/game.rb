module FizzBuzzComponent
  module Controls
    module Game
      def self.id
        Identifier::UUID::Controls::Incrementing.example(id_increment)
      end

      def self.id_increment
        1000
      end
    end
  end
end
