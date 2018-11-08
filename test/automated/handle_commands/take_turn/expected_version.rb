require_relative '../../automated_init'

context "Handle Commands" do
  context "Take Turn" do
    context "Expected Version" do
      handler = Handlers::Commands.new

      take_turn = Controls::Commands::TakeTurn.example

      game_id = take_turn.game_id or fail

      game = Controls::Game.example
      version = Controls::Version.example
      handler.store.add(game_id, game, version)

      handler.(take_turn)

      writer = handler.write

      turn_taken = writer.one_message do |message|
        message.instance_of?(Messages::Events::TurnTaken)
      end
      refute(turn_taken.nil?)

      test "Is entity version" do
        written_to_stream = writer.written?(turn_taken) do |_, expected_version|
          expected_version == version
        end

        assert(written_to_stream)
      end
    end
  end
end
