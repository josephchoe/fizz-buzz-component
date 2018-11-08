module FizzBuzzComponent
  module Controls
    module Events
      module TurnRejected
        def self.example(game_id: nil, counter: nil, answer: nil, time: nil, previous_message: nil, position: nil, global_position: nil)
          game_id ||= Game.id
          counter ||= self.counter
          answer ||= self.answer
          time ||= Time::Effective.example

          previous_message ||= Message.example

          position ||= Position.example
          global_position ||= Position::Global.example

          stream_name = StreamName::Game.example(game_id: game_id)

          turn_rejected = Messages::Events::TurnRejected.new

          turn_rejected.game_id = game_id
          turn_rejected.answer = answer
          turn_rejected.counter = counter
          turn_rejected.time = time

          turn_rejected.metadata.stream_name = stream_name
          turn_rejected.metadata.position = position
          turn_rejected.metadata.global_position = global_position

          unless previous_message.nil?
            turn_rejected.metadata.follow(previous_message.metadata)
          end

          turn_rejected
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
