require_relative '../../../automated_init'

context "Handle Events" do
  context "Turn Taken" do
    context "Ignored" do
      context "Game Is Not Yet Over" do
        turn_taken = Controls::Events::TurnTaken.example

        handler = Handlers::Events.new

        game_id = turn_taken.game_id or fail

        game = Controls::Game.example
        refute(game.ended?)
        refute(game.over?)

        handler.store.add(game_id, game)

        handler.(turn_taken)

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
end
