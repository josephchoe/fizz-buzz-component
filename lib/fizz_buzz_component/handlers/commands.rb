module FizzBuzzComponent
  module Handlers
    class Commands
      include Messaging::Handle
      include Messaging::StreamName

      include Messages::Commands
      include Messages::Events

      dependency :clock, Clock::UTC
      dependency :store, Store
      dependency :write, Messaging::Postgres::Write

      category :fizz_buzz

      def configure(session: nil)
        Clock::UTC.configure(self)
        Messaging::Postgres::Write.configure(self, session: session)
      end

      handle TakeTurn do |take_turn|
        game_id = take_turn.game_id

        game, version = store.fetch(game_id, include: :version)

        answer = take_turn.answer

        if game.correct?(answer)
          event = TurnTaken.follow(take_turn)
          event.processed_time = clock.iso8601
        else
          event = TurnRejected.follow(take_turn, exclude: :time)
          event.time = clock.iso8601
        end

        event.counter = game.counter

        stream_name = stream_name(game_id)

        write.(event, stream_name, expected_version: version)
      end
    end
  end
end
