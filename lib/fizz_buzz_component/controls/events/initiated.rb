module FizzBuzzComponent
  module Controls
    module Events
      module Initiated
        def self.example(game_id: nil, time: nil, processed_time: nil, previous_message: nil, global_position: nil)
          game_id ||= Game.id
          time ||= Time::Effective.example

          previous_message ||= Message.example

          global_position ||= self.global_position

          stream_name = Messaging::StreamName.stream_name(game_id, 'fizzBuzz')

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

        def self.position
          0
        end

        def self.global_position
          Position::Global.example + global_position_increment
        end

        def self.global_position_increment
          222
        end
      end
    end
  end
end
