require_relative '../../automated_init'

context "Handle Events" do
  context "Turn Rejected" do
    context "Expected Version" do
      turn_rejected = Controls::Events::TurnRejected.example

      handler = Handlers::Events.new

      game_id = turn_rejected.game_id or fail

      game = Controls::Game::Ended.example
      assert(game.ended?)

      handler.store.add(game_id, game)

      handler.(turn_rejected)

      writer = handler.write

      game_ended = writer.one_message do |message|
        message.instance_of?(Messages::Events::GameEnded)
      end

      test "Game ended event is not written" do
        assert(game_ended.nil?)
      end
    end
  end
end
