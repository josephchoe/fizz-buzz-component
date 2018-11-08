require_relative '../../automated_init'

context "Handle Events" do
  context "Turn Rejected" do
    context "Game Ended" do
      turn_rejected = Controls::Events::TurnRejected.example

      handler = Handlers::Events.new

      game_id = turn_rejected.game_id or fail

      game = Controls::Game.example
      refute(game.ended?)

      handler.store.add(game_id, game)

      handler.(turn_rejected)

      writer = handler.write

      game_ended = writer.one_message do |message|
        message.instance_of?(Messages::Events::GameEnded)
      end

      test "Game ended event is written" do
        refute(game_ended.nil?)
      end

      test "Written to fizz buzz stream" do
        control_stream_name = Controls::StreamName::FizzBuzz.example(game_id: game_id)

        written_to_stream = writer.written?(game_ended) do |stream_name|
          stream_name == control_stream_name
        end

        assert(written_to_stream)
      end

      context "Attributes" do
        test "Game ID" do
          assert(game_ended.game_id == game_id)
        end

        test "Time is copied from turn rejected event" do
          time = turn_rejected.time or fail

          assert(game_ended.time == time)
        end
      end

      context "Metadata" do
        test "Game ended event follows turn rejected event" do
          assert(game_ended.follows?(turn_rejected))
        end
      end
    end
  end
end
