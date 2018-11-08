require_relative '../../automated_init'

context "Handle Events" do
  context "Turn Taken" do
    context "Expected Version" do
      turn_taken = Controls::Events::TurnTaken::Final.example

      handler = Handlers::Events.new

      game_id = turn_taken.game_id or fail

      game = Controls::Game::Over.example
      version = Controls::Version.example
      handler.store.add(game_id, game, version)

      handler.(turn_taken)

      writer = handler.write

      game_ended = writer.one_message do |message|
        message.instance_of?(Messages::Events::GameEnded)
      end
      refute(game_ended.nil?)

      test "Is entity version" do
        written_to_stream = writer.written?(game_ended) do |_, expected_version|
          expected_version == version
        end

        assert(written_to_stream)
      end
    end
  end
end
