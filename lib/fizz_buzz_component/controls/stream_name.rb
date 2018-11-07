module FizzBuzzComponent
  module Controls
    module StreamName
      def self.example(game_id: nil)
        game_id ||= Game.id

        Messaging::StreamName.stream_name(game_id, 'fizzBuzz')
      end
    end
  end
end
