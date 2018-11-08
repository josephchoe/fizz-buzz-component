module FizzBuzzComponent
  module Controls
    module Events
      module GameEnded
        def self.example(game_id: nil, time: nil, position: nil, global_position: nil)
          game_id ||= Game.id
          time ||= Time::Effective.example

          previous_message ||= Message.example

          position ||= Position.example
          global_position ||= Position::Global.example

          stream_name = StreamName::Game.example(game_id: game_id)

          game_ended = Messages::Events::GameEnded.new

          game_ended.game_id = game_id
          game_ended.answer = answer
          game_ended.counter = counter
          game_ended.time = time

          game_ended.metadata.stream_name = stream_name
          game_ended.metadata.position = position
          game_ended.metadata.global_position = global_position

          unless previous_message.nil?
            game_ended.metadata.follow(previous_message.metadata)
          end

          game_ended
        end
      end
    end
  end
end
