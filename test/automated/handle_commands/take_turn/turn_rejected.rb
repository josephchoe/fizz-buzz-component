require_relative '../../automated_init'

context "Handle Commands" do
  context "Take Turn" do
    context "Turn Rejected" do
      handler = Handlers::Commands.new

      take_turn = Controls::Commands::TakeTurn::Incorrect.example

      game_id = take_turn.game_id or fail

      game = Controls::Game.example
      handler.store.add(game_id, game)

      time = Controls::Time::Processed::Raw.example
      handler.clock.now = time

      handler.(take_turn)

      writer = handler.write

      turn_rejected = writer.one_message do |message|
        message.instance_of?(Messages::Events::TurnRejected)
      end
      refute(turn_rejected.nil?)

      test "Turn rejected event is written" do
        refute(turn_rejected.nil?)
      end

      test "Written to the fizz buzz stream" do
        control_stream_name = Controls::StreamName::FizzBuzz.example(game_id: game_id)

        written_to_stream = writer.written?(turn_rejected) do |stream_name|
          stream_name == control_stream_name
        end

        assert(written_to_stream)
      end

      context "Attributes" do
        test "Game ID" do
          assert(turn_rejected.game_id == game_id)
        end

        test "Counter" do
          counter = game.counter or fail

          assert(turn_rejected.counter == counter)
        end

        test "Answer" do
          answer = take_turn.answer or fail

          assert(turn_rejected.answer == answer)
        end

        test "Time" do
          time_iso8601 = Clock.iso8601(time)

          assert(turn_rejected.time == time_iso8601)
        end
      end

      context "Metadata" do
        test "Turn rejected event follows take turn command" do
          assert(turn_rejected.follows?(take_turn))
        end
      end
    end
  end
end
