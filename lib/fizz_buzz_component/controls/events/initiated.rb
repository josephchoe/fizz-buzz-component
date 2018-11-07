module FizzBuzzComponent
  module Controls
    module Events
      module Initiated
        def self.example(game_id: nil, time: nil, processed_time: nil, previous_message: nil, global_position: nil)
          game_id ||= Game.id
          time ||= Time::Effective.example
          processed_time ||= Time::Processed.example

          previous_message ||= Message.example

          position = Position::Initial.example
          global_position ||= Position::Global.example

          stream_name = StreamName::Game.example(game_id: game_id)

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
      end
    end
  end
end
