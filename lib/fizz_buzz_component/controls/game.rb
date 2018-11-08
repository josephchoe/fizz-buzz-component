module FizzBuzzComponent
  module Controls
    module Game
      def self.example(id=nil, counter: nil, started_time: nil, ended_time: nil)
        id ||= self.id
        counter ||= Counter.example
        started_time ||= Time::Effective::Raw.example

        game = New.example

        game.id = id
        game.counter = counter
        game.started_time = started_time

        unless ended_time.nil?
          game.ended_time = ended_time
        end

        game
      end

      def self.id
        Identifier::UUID::Controls::Incrementing.example(id_increment)
      end

      def self.id_increment
        1000
      end

      module New
        def self.example
          FizzBuzzComponent::Game.new
        end
      end

      module Over
        def self.example
          Game.example(counter: counter)
        end

        def self.counter
          Counter::Final.example
        end
      end

      module Ended
        def self.example
          ended_time = Time::Effective::Raw.example

          Game.example(ended_time: ended_time)
        end
      end
    end
  end
end
