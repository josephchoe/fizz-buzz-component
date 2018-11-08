module FizzBuzzComponent
  module Controls
    module Answer
      def self.example
        '11'
      end

      def self.counter
        11
      end

      module Initial
        def self.example
          '1'
        end

        def self.counter
          1
        end
      end

      module Incorrect
        def self.example
          '3'
        end

        def self.counter
          3
        end
      end

      module Final
        def self.example
          'Buzz'
        end

        def self.counter
          100
        end
      end
    end
  end
end
