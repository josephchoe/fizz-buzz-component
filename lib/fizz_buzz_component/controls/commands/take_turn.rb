module FizzBuzzComponent
  module Controls
    module Commands
      module TakeTurn
        def self.example(game_id: nil, answer: nil, time: nil, previous_message: nil, position: nil, global_position: nil)
          game_id ||= Game.id
          answer ||= self.answer
          time ||= Time::Effective.example

          previous_message ||= Message.example

          position ||= Position.example
          global_position ||= Position::Global.example

          stream_name = StreamName::Game.example(game_id: game_id)

          take_turn = Messages::Commands::TakeTurn.new

          take_turn.game_id = game_id
          take_turn.answer = answer
          take_turn.time = time

          take_turn.metadata.stream_name = stream_name
          take_turn.metadata.position = position
          take_turn.metadata.global_position = global_position

          unless previous_message.nil?
            take_turn.metadata.follow(previous_message.metadata)
          end

          take_turn
        end

        def self.answer
          '11'
        end

        def self.counter
          11
        end

        module Initial
          def self.example
            TakeTurn.example(answer: answer, position: position)
          end

          def self.position
            0
          end

          def self.answer
            '1'
          end
        end
      end
    end
  end
end
