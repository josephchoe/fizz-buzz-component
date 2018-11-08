module FizzBuzzComponent
  module Handlers
    class Events
      include Messaging::Handle
      include Messaging::StreamName
      include Log::Dependency

      include Messages::Events

      dependency :store, Store
      dependency :write, Messaging::Postgres::Write

      category :fizz_buzz

      def configure(session: nil)
        Store.configure(self)
        Messaging::Postgres::Write.configure(self, session: session)
      end

      handle TurnTaken do |turn_taken|
        game_id = turn_taken.game_id

        game, version = store.fetch(game_id, include: :version)

        if !game.over? || game.ended?
          logger.info(tag: :ignored) { "Event ignored (Event Type: #{turn_taken.type}, Game ID: #{game_id}, Counter: #{game.counter})" }
          return
        end

        game_ended = GameEnded.follow(turn_taken, exclude: [:counter, :answer, :processed_time])

        stream_name = stream_name(game_id)

        write.(game_ended, stream_name, expected_version: version)
      end

      handle TurnRejected do |turn_rejected|
        game_id = turn_rejected.game_id

        game, version = store.fetch(game_id, include: :version)

        if game.ended?
          logger.info(tag: :ignored) { "Event ignored (Event Type: #{turn_taken.type}, Game ID: #{game_id}, Counter: #{game.counter})" }
          return
        end

        game_ended = GameEnded.follow(turn_rejected, exclude: [:counter, :answer])

        stream_name = stream_name(game_id)

        write.(game_ended, stream_name, expected_version: version)
      end
    end
  end
end
