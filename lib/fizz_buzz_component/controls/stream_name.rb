module FizzBuzzComponent
  module Controls
    module StreamName
      module FizzBuzz
        def self.example(game_id: nil)
          game_id ||= Controls::Game.id

          Messaging::StreamName.stream_name(game_id, 'fizzBuzz')
        end

        module Command
          def self.example(game_id: nil)
            game_id ||= Controls::Game.id

            Messaging::StreamName.command_stream_name(game_id, 'fizzBuzz')
          end
        end
      end
    end
  end
end
