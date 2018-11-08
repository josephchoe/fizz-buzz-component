module FizzBuzzComponent
  module Commands
    class TakeTurn
      include Messaging::StreamName

      dependency :clock, Clock::UTC
      dependency :write, Messaging::Postgres::Write

      category :fizz_buzz

      def self.build
        instance = new
        Clock::UTC.configure(instance)
        Messaging::Postgres::Write.configure(instance)
        instance
      end

      def self.call(**attributes)
        instance = build
        instance.(**attributes)
      end

      def call(game_id:, answer:, previous_message: nil)
        take_turn = Messages::Commands::TakeTurn.new

        unless previous_message.nil?
          take_turn.metadata.follow(previous_message.metadata)
        end

        take_turn.game_id = game_id
        take_turn.answer = answer
        take_turn.time = clock.iso8601

        stream_name = command_stream_name(game_id)

        write.(take_turn, stream_name)
      end
    end
  end
end
