module FizzBuzzComponent
  module Controls
    module Game
      def self.example(id=nil, counter: nil, initiated_time: nil, finished_time: nil)
        id ||= self.id
        counter ||= Counter.example
        initiated_time ||= Time::Effective::Raw.example

        game = New.example

        game.id = id
        game.counter = counter
        game.initiated_time = initiated_time

        unless finished_time.nil?
          game.finished_time = finished_time
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

      module Finished
        def self.example
          finished_time = Time::Effective::Raw.example

          Game.example(finished_time: finished_time)
        end
      end
    end
  end
end
