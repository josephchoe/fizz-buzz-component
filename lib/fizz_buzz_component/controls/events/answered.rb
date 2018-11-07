module FizzBuzzComponent
  module Controls
    module Events
      module Answered
        def self.example(answer: nil, counter: nil, game_id: nil, time: nil, processed_time: nil, previous_message: nil, position: nil, global_position: nil)
          answer ||= self.answer
          counter ||= self.counter
          game_id ||= Game.id
          time ||= Time::Effective.example

          previous_message ||= Message.example

          position ||= Position.example
          global_position ||= Position::Global.example

          stream_name = StreamName.example(game_id: game_id)

          initiated = Messages::Events::Initiated.new

          initiated.game_id = game_id
          initiated.time = time
          initiated.processed_time = processed_time

          initiated.metadata.stream_name = stream_name
          initiated.metadata.position = position
          initiated.metadata.global_position = global_position

          unless previous_message.nil?
            initiated.metadata.follow(previous_message.metadata)
          end

          initiated
        end

        def self.answer
          '11'
        end

        def self.counter
          11
        end
      end
    end
  end
end
