require_relative '../../automated_init'

context "Projection" do
  context "Turn Taken" do
    game = Controls::Game.example

    counter = game.counter or fail

    turn_taken = Controls::Events::TurnTaken.example

    Projection.(game, turn_taken)

    context "Attributes" do
      test "Counter is increased by one" do
        assert(game.counter == counter + 1)
      end
    end
  end
end
