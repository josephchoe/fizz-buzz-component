module FizzBuzzComponent
  module Controls
    module Events
      module Answered
        def self.example(answer: nil, counter: nil, game_id: nil, time: nil, processed_time: nil, previous_message: nil, position: nil, global_position: nil)
          answer ||= self.answer
          counter ||= self.counter
          game_id ||= Game.id
          time ||= Time::Effective.example
          processed_time ||= Time::Processed.example

          previous_message ||= Message.example

          position ||= Position.example
          global_position ||= Position::Global.example

          stream_name = StreamName::Game.example(game_id: game_id)

          answered = Messages::Events::Answered.new

          answered.game_id = game_id
          answered.answer = answer
          answered.counter = counter
          answered.time = time
          answered.processed_time = processed_time

          answered.metadata.stream_name = stream_name
          answered.metadata.position = position
          answered.metadata.global_position = global_position

          unless previous_message.nil?
            answered.metadata.follow(previous_message.metadata)
          end

          answered
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
