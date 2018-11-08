module FizzBuzzComponent
  module Controls
    module Counter
      def self.example
        Answer.counter
      end

      module Initial
        def self.example
          Answer::Initial.counter
        end
      end

      module Final
        def self.example
          Answer::Final.counter
        end
      end
    end
  end
end
