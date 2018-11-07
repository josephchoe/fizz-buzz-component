module FizzBuzzComponent
  module Controls
    module Events
      module AnswerRejected
        def self.example(answer: nil, counter: nil, game_id: nil, time: nil, previous_message: nil, position: nil, global_position: nil)
          answer ||= self.answer
          counter ||= Counter.example
          game_id ||= Game.id
          time ||= Time::Effective.example

          previous_message ||= Message.example

          position ||= Position.example
          global_position ||= Position::Global.example

          stream_name = StreamName::Game.example(game_id: game_id)

          answer_rejected = Messages::Events::AnswerRejected.new

          answer_rejected.game_id = game_id
          answer_rejected.answer = answer
          answer_rejected.counter = counter
          answer_rejected.time = time

          answer_rejected.metadata.stream_name = stream_name
          answer_rejected.metadata.position = position
          answer_rejected.metadata.global_position = global_position

          unless previous_message.nil?
            answer_rejected.metadata.follow(previous_message.metadata)
          end

          answer_rejected
        end

        def self.answer
          'wrong-answer'
        end
      end
    end
  end
end
