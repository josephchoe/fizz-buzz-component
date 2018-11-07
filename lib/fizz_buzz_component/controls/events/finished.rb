module FizzBuzzComponent
  module Controls
    module Events
      module Finished
        def self.example(game_id: nil, time: nil, previous_message: nil, global_position: nil)
          game_id ||= Game.id
          time ||= Time::Effective.example

          previous_message ||= Message.example

          position = Position::Initial.example
          global_position ||= Position::Global.example

          stream_name = StreamName::Game.example(game_id: game_id)

          finished = Messages::Events::Finished.new

          finished.game_id = game_id
          finished.time = time

          finished.metadata.stream_name = stream_name
          finished.metadata.position = position
          finished.metadata.global_position = global_position

          unless previous_message.nil?
            finished.metadata.follow(previous_message.metadata)
          end

          finished
        end
      end
    end
  end
end
